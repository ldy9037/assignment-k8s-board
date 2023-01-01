resource "tfe_workspace" "cicd_workspace" {
  name                = var.workspace_name["cicd"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["cicd"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "dns_workspace" {
  name                = var.workspace_name["dns"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["dns"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "iam_workspace" {
  name              = var.workspace_name["iam"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["iam"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "eks_workspace" {
  name                = var.workspace_name["eks"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["eks"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

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

resource "tfe_workspace" "network_workspace" {
  name                = var.workspace_name["network"]
  organization        = tfe_organization.organization.id
  terraform_version   = var.tfc_terraform_version
  working_directory   = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["network"]}"
  global_remote_state = true

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}

resource "tfe_workspace" "storage_workspace" {
  name              = var.workspace_name["storage"]
  organization      = tfe_organization.organization.id
  terraform_version = var.tfc_terraform_version
  working_directory = "${var.workspace_working_directory_prefix}/${var.workspace_working_directory["storage"]}"

  vcs_repo {
    identifier     = "${var.github_username}/${var.github_repository}"
    branch         = var.github_branch
    oauth_token_id = var.oauth_token_id
  }
}