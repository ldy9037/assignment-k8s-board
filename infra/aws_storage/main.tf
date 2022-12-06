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

module "s3_static_contents" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.1.1"

  bucket = "s3-k8s-board-static-contents"  
}