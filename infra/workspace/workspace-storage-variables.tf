resource "tfe_variable" "storage_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.storage_workspace.id
}