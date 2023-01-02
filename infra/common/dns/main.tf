terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.12.0"
    }
  }

  cloud {
    organization = "emd-blog"
    workspaces {
      name = "common-dns"
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

module "route53" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "2.10.1"

  zones = var.route53_zones
}