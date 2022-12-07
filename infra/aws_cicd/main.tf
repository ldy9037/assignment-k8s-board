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
      name = "cicd"
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

module "jenkins_s3_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.1.0"

  name        = var.jenkins_s3_policy_name
  path        = var.jenkins_s3_policy_path
  description = var.jenkins_s3_policy_description

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:DeleteObjects",
        "s3:GetObject",
        "s3:ListBuckets",
        "s3:GetBucket"
      ],
      "Effect": "Allow",
      "Resource": "s3:*"
    }
  ]
}
EOF
}

module "iam_user_jenkins" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.1.0"

  name = var.iam_user_jenkins_name

  create_iam_access_key         = var.iam_user_jenkins_create_iam_access_key
  create_iam_user_login_profile = var.iam_user_jenkins_create_login_profile
}

module "iam_group_jenkins" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  name = var.iam_group_jenkins_name

  create_group             = var.iam_group_jenkins_create_group
  custom_group_policy_arns = [module.jenkins_s3_policy.arn]
  group_users              = [module.iam_user_jenkins.iam_user_name]
}

module "ec2_jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = (var.environment_use) ? 1 : 0

  name = "${var.ec2_jenkins_name}-${count.index + 1}"

  ami           = var.ec2_jenkins_ami
  instance_type = var.ec2_jenkins_instance_type
  subnet_id     = data.tfe_outputs.network_output.values.public_subnets[count.index]
  key_name      = var.ec2_jenkins_name
  vpc_security_group_ids = [
    data.tfe_outputs.network_output.values.developer_to_ssh_sg,
    data.tfe_outputs.network_output.values.developer_to_was_sg
  ]
}