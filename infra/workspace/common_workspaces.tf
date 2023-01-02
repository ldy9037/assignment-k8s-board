resource "tfe_workspace" "cicd_workspace" {
  name                = var.workspace_name["common"]["cicd"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["cicd"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "dns_workspace" {
  name                = var.workspace_name["common"]["dns"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["dns"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "iam_workspace" {
  name              = var.workspace_name["common"]["iam"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["iam"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "monitoring_workspace" {
  name              = var.workspace_name["common"]["monitoring"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["monitoring"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "network_workspace" {
  name                = var.workspace_name["common"]["network"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["network"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "storage_workspace" {
  name              = var.workspace_name["common"]["storage"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["common"]["storage"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}