terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5.0"
    }
  }

  cloud {
    organization = "k8s-app"
    workspaces {
      name = "storage"
    }
  }

  required_version = ">= 1.1.7"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.tags_environment
      IAC         = var.tags_iac
      Team        = var.tags_team
      Owner       = var.tags_owner
    }
  }
}

data "tfe_outputs" "dns_output" {
  organization = var.organization_name
  workspace    = var.dns_workspace_name
}

data "aws_iam_policy_document" "allow_public_read_role_policy" {
  statement {
    actions = [
      "s3:GetObject",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Allow"

    resources = [
      "arn:aws:s3:::${var.static_contents_bucket}/*",
    ]
  }
}

module "s3_static_contents" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.1.1"

  bucket = var.static_contents_bucket

  attach_policy = var.static_contents_attach_policy
  policy        = data.aws_iam_policy_document.allow_public_read_role_policy.json

  website = {
    index_document = var.static_contents_website_index
    routing_rules  = var.static_contents_website_routing_rules
  }
}

/*
resource "aws_route53_record" "static_content_record" {
  zone_id = values(data.tfe_outputs.dns_output.values.route53_zones_id)[0]
  name    = var.route53_record_name
  type    = var.route53_record_type
  ttl     = var.route53_record_ttl
  records = [aws_cloudfront_distribution.board_cloudfront_distribution.domain_name]
}*/
/*
module "static_contents_acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.1"

  domain_name = "${aws_route53_record.static_content_record.name}.${values(data.tfe_outputs.dns_output.values.route53_zones_name)[0]}"
  zone_id     = values(data.tfe_outputs.dns_output.values.route53_zones_id)[0]

  create_route53_records = var.static_contents_acm_create
  wait_for_validation    = var.static_contents_acm_wfv

  depends_on = [
    aws_route53_record.static_content_record
  ]
}
*/

resource "aws_cloudfront_origin_access_control" "board_cloudfront_oac" {
  name                              = "board-cloudfront-origin-access-control"
  description                       = ""
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "board_cloudfront_distribution" {

  origin {
    domain_name              = module.s3_static_contents.s3_bucket_website_endpoint
    origin_access_control_id = aws_cloudfront_origin_access_control.board_cloudfront_oac.id
    origin_id                = "s3-board"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  aliases = ["${var.route53_record_name}.${values(data.tfe_outputs.dns_output.values.route53_zones_name)[0]}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-board"

    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "s3-board"

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "blacklist"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}