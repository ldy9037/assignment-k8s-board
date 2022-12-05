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
      name = "iam"
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

module "iam_group_complete_with_custom_policy" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  for_each = var.iam_group_with_policy

  name = each.key

  create_group = each.value["create_group"]

  custom_group_policy_arns = each.value["custom_group_policy_arns"]
  group_users              = var.iam_user[each.key]
}