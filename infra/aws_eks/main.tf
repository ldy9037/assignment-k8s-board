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
      name = "eks"
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

resource "aws_eks_cluster" "eks_cluster_blog" {
  name     = var.eks_cluster_blog_name
  version  = var.eks_cluster_blog_version
  role_arn = module.eks_cluster_role.iam_role_arn

  vpc_config {
    subnet_ids = data.tfe_outputs.network_output.values.private_subnets
  }

  depends_on = [
    module.eks_cluster_role
  ]
}
