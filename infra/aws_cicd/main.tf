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