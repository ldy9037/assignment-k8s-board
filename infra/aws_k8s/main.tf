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

module "board_cluster_s3_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.1.0"

  name        = var.board_cluster_s3_policy_name
  path        = var.board_cluster_s3_policy_path
  description = var.board_cluster_s3_policy_description

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

module "eks_board_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.1"

  create_role = var.eks_board_role_create_role

  role_name = var.eks_board_role_name

  custom_role_policy_arns = [
    module.board_cluster_s3_policy.arn,
    data.aws_iam_policy.iam_policy_eks_cluster.arn
  ]

  number_of_custom_role_policy_arns = 2
}

module "ecr-board" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name = var.ecr_board_repository_name

  repository_lifecycle_policy = jsonencode({
    rules = var.ecr_board_repository_lifecycle_policy
  })
}
