resource "tfe_workspace" "k8s_workspace" {
  name                = var.workspace_name["k8s"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["k8s"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}