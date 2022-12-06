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
      name = "network"
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

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = ["${var.region}a", "${var.region}c"]
  database_subnets = var.database_subnets
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  create_database_subnet_group = var.create_database_subnet_group
  enable_nat_gateway           = var.enable_nat_gateway
}