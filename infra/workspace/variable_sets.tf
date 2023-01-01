resource "tfe_variable_set" "variable_set_global" {
  name         = "variable-set-global"
  description  = "모든 작업 공간에 적용 될 변수 집합"
  global       = true
  organization = tfe_organization.organization.name
}

resource "tfe_variable" "aws_accesskey" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = var.aws_access_key
  category        = "env"
  description     = "AWS Access Key for all workspaces"
  sensitive       = true
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "aws_secret_accesskey" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = var.aws_secret_access_key
  category        = "env"
  description     = "AWS Secret Access Key for all workspaces"
  sensitive       = true
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "region" {
  key             = "region"
  value           = var.region
  category        = "terraform"
  description     = "AWS Region"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "aws_account_id" {
  key             = "aws_account_id"
  value           = var.aws_account_id
  category        = "terraform"
  description     = "AWS Account ID"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "tags_iac" {
  key             = "tags_iac"
  value           = var.tags_iac
  category        = "terraform"
  description     = "AWS team tag name"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "tags_team" {
  key             = "tags_team"
  value           = var.tags_team
  category        = "terraform"
  description     = "AWS team tag name"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "tags_owner" {
  key             = "tags_owner"
  value           = var.tfc_owner
  category        = "terraform"
  description     = "AWS Resource owner"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "organization_name" {
  key             = "organization_name"
  value           = tfe_organization.organization.name
  category        = "terraform"
  description     = "Organization name"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "network_workspace_name" {
  key             = "network_workspace_name"
  value           = tfe_workspace.network_workspace.name
  category        = "terraform"
  description     = "Network workspace name"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "dns_workspace_name" {
  key             = "dns_workspace_name"
  value           = tfe_workspace.dns_workspace.name
  category        = "terraform"
  description     = "DNS workspace name"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "github_username" {
  key             = "github_username"
  value           = var.github_username
  category        = "terraform"
  description     = "Github username or organization"
  variable_set_id = tfe_variable_set.variable_set_global.id
}

resource "tfe_variable" "github_repository" {
  key             = "github_repository"
  value           = var.github_repository
  category        = "terraform"
  description     = "Github repository"
  variable_set_id = tfe_variable_set.variable_set_global.id
}