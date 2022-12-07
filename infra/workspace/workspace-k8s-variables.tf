resource "tfe_variable" "k8s_tags_environment" {
  key          = "tags_environment"
  value        = var.project_env["prod"]
  category     = "terraform"
  description  = "AWS Resource environment"
  workspace_id = tfe_workspace.k8s_workspace.id
}