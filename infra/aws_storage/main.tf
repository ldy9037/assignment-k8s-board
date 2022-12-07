terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
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