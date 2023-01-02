resource "tfe_workspace" "blog_common_workspace" {
  name                = var.workspace_name["service"]["blog"]["common"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["service"]["blog"]["common"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "blog_post_workspace" {
  name                = var.workspace_name["service"]["blog"]["post"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["service"]["blog"]["post"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}