resource "tfe_variable" "network_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.network_workspace.id
}