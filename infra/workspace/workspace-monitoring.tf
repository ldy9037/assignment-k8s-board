resource "tfe_workspace" "monitoring_workspace" {
  name              = var.workspace_name["monitoring"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["monitoring"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}