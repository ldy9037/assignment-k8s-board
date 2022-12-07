resource "tfe_variable" "dns_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.dns_workspace.id
}