resource "tfe_variable" "cicd_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.cicd_workspace.id
}

resource "tfe_variable" "dns_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.dns_workspace.id
}

resource "tfe_variable" "iam_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.iam_workspace.id
}

resource "tfe_variable" "eks_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.eks_workspace.id
}

resource "tfe_variable" "monitoring_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.monitoring_workspace.id
}

resource "tfe_variable" "network_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.network_workspace.id
}

resource "tfe_variable" "storage_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.storage_workspace.id
}