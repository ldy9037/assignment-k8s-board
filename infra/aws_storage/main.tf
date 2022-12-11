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

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
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

resource "aws_route53_record" "static_content_record" {
  zone_id = values(data.tfe_outputs.dns_output.values.route53_zones_id)[0]
  name    = var.route53_record_name
  type    = var.route53_record_type
  ttl     = var.route53_record_ttl
  records = var.route53_record_records
}

module "static_contents_acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.1"

  providers = {
    aws = aws.us-east-1
  }

  domain_name = "${var.route53_record_name}.${values(data.tfe_outputs.dns_output.values.route53_zones_name)[0]}"
  zone_id     = values(data.tfe_outputs.dns_output.values.route53_zones_id)[0]

  create_route53_records = var.static_contents_acm_create
  wait_for_validation    = var.static_contents_acm_wfv
}