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

data "aws_iam_policy" "iam_policy_eks_node" {
  count = length(var.iam_policy_eks_node_names)
  name  = var.iam_policy_eks_node_names[count.index]
}

data "aws_iam_policy_document" "eks_role_trust_policy" {
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

  custom_role_trust_policy = data.aws_iam_policy_document.eks_role_trust_policy.json
  custom_role_policy_arns = [
    data.aws_iam_policy.iam_policy_eks_cluster.arn
  ]
}

module "eks_board_node_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.1"

  create_role = var.eks_board_node_role_create_role

  role_name = var.eks_board_node_role_name

  custom_role_trust_policy = data.aws_iam_policy_document.eks_role_trust_policy.json
  custom_role_policy_arns  = [for eks_node_policy in data.aws_iam_policy.iam_policy_eks_node : eks_node_policy.arn]
}

module "ecr_board" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name = var.ecr_board_repository_name

  repository_lifecycle_policy = jsonencode({
    rules = var.ecr_board_repository_lifecycle_policy
  })
}

module "eks_board" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = var.eks_board_cluster_name
  cluster_version = var.eks_board_cluster_version

  cluster_endpoint_public_access = var.eks_board_cluster_endpoint_public_access

  vpc_id     = data.tfe_outputs.network_output.values.vpc_id
  subnet_ids = data.tfe_outputs.network_output.values.private_subnets

  iam_role_arn = module.eks_board_role.iam_role_arn
}