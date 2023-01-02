terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.22.0"
    }
  }

  cloud {
    organization = "emd-blog"
    workspaces {
      name = "service-blog-post"
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

data "tfe_outputs" "network_output" {
  organization = var.organization_name
  workspace    = var.network_workspace_name
}

data "tfe_outputs" "dns_output" {
  organization = var.organization_name
  workspace    = var.dns_workspace_name
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name                 = var.ecr_repository_name
  repository_image_tag_mutability = var.ecr_repository_image_tag_mutability
  repository_lifecycle_policy = jsonencode({
    rules = var.ecr_repository_lifecycle_policy
  })
}