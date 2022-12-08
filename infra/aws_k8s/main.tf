terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.22.0"
    }
  }

  cloud {
    organization = "k8s-app"
    workspaces {
      name = "k8s"
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

data "aws_iam_policy" "iam_policy_eks_cluster" {
  name = var.iam_policy_eks_cluster_name
}

data "aws_iam_policy_document" "allow_public_read_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    effect = "Allow"
  }
}

module "eks_board_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.1"

  create_role = var.eks_board_role_create_role

  role_name = var.eks_board_role_name

  custom_role_trust_policy = data.aws_iam_policy_document.allow_public_read_role_policy.json
  custom_role_policy_arns = [
    data.aws_iam_policy.iam_policy_eks_cluster.arn
  ]
}

module "ecr-board" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name = var.ecr_board_repository_name

  repository_lifecycle_policy = jsonencode({
    rules = var.ecr_board_repository_lifecycle_policy
  })
}
