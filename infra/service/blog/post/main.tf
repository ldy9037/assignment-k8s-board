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

data "tfe_outputs" "iam_output" {
  organization = var.organization_name
  workspace = "common-iam"
}

data "tfe_outputs" "blog_common_output" {
  organization = var.organization_name
  workspace    = var.blog_common_workspace_name
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

resource "aws_eks_node_group" "eks_node_group_post" {
  cluster_name    = data.tfe_outputs.blog_common_output.values.eks_cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = module.eks_node_role.iam_role_arn
  subnet_ids      = data.tfe_outputs.network_output.values.private_subnets

  ami_type       = var.node_group_ami_type
  capacity_type  = var.node_group_capacity_type
  disk_size      = var.node_group_disk_size
  instance_types = var.node_group_instance_types

  scaling_config {
    desired_size = var.node_group_sc_desired_size
    max_size     = var.node_group_sc_max_size
    min_size     = var.node_group_sc_min_size
  }

  depends_on = [
    module.eks_node_role
  ]
}