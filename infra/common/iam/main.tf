terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11.0"
    }
  }

  cloud {
    organization = "emd-blog"
    workspaces {
      name = "common-iam"
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

module "iam_user_administrator" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.1.0"

  count = length(var.iam_user["Administrator"])

  name = var.iam_user["Administrator"][count.index]

  create_iam_access_key         = var.iam_user_create_iam_access_key
  create_iam_user_login_profile = var.iam_user_create_login_profile
}

module "iam_github_oidc_provider" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-provider"
  version = "5.9.2"
}

module "iam_github_oidc_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-github-oidc-role"
  version = "5.9.2"

  name = var.iam_github_oidc_role_name

  subjects = ["${var.github_username}/${var.github_repository}:*"]

  policies = {
    GithubActionsDeployPolicy = module.github_actions_deploy_policy.arn
  }
}

module "github_actions_deploy_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.1.0"

  name        = var.github_actions_deploy_policy_name
  path        = var.github_actions_deploy_policy_path
  description = var.github_actions_deploy_policy_description

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecr:GetAuthorizationToken",
        "eks:DescribeCluster",
        "eks:ListClusters"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}