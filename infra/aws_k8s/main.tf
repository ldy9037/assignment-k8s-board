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

data "aws_iam_policy_document" "eks_node_role_trust_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
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

  custom_role_trust_policy = data.aws_iam_policy_document.eks_node_role_trust_policy.json
  custom_role_policy_arns  = [for eks_node_policy in data.aws_iam_policy.iam_policy_eks_node : eks_node_policy.arn]
}

module "ecr_board" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.5.1"

  repository_name = var.ecr_board_repository_name
  repository_image_tag_mutability = var.ecr_board_repository_image_tag_mutability
  repository_lifecycle_policy = jsonencode({
    rules = var.ecr_board_repository_lifecycle_policy
  })
}

resource "aws_eks_cluster" "eks_cluster_board" {
  name     = var.eks_board_cluster_name
  role_arn = module.eks_board_role.iam_role_arn
  version  = var.eks_board_cluster_version

  vpc_config {
    subnet_ids = data.tfe_outputs.network_output.values.private_subnets
  }

  depends_on = [
    module.eks_board_role
  ]
}

resource "aws_eks_node_group" "eks_node_group_board" {
  cluster_name    = aws_eks_cluster.eks_cluster_board.name
  node_group_name = var.node_group_board_name
  node_role_arn   = module.eks_board_node_role.iam_role_arn
  subnet_ids      = data.tfe_outputs.network_output.values.private_subnets

  launch_template {
    id      = aws_launch_template.launch_template_board.id
    version = var.node_group_board_lt_version
  }

  scaling_config {
    desired_size = var.node_group_board_sc_desired_size
    max_size     = var.node_group_board_sc_max_size
    min_size     = var.node_group_board_sc_min_size
  }

  depends_on = [
    module.eks_board_node_role
  ]
}

resource "aws_launch_template" "launch_template_board" {
  name = var.launch_template_board_name

  image_id      = var.launch_template_board_image_id
  instance_type = var.launch_template_board_instance_type

  network_interfaces {
    associate_public_ip_address = var.launch_template_board_ni_public_ip
  }
}