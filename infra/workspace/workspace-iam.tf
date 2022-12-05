resource "tfe_workspace" "iam_workspace" {
  name              = var.workspace_name["iam"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = var.workspace_working_directory["iam"]

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}