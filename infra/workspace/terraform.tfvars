tfc_org   = "k8s-app"
tfc_owner = "ldy9037@naver.com"
tfc_membership = [
]
tfc_defualt_team_name = "owners"
tfc_terraform_version = "= 1.1.7"

oauth_client_service_provider = "github"

github_username   = "ldy9037"
github_repository = "assignment-k8s-board"
github_branch     = "main"


workspace_name = {
  iam        = "iam"
  monitoring = "monitoring"
  network    = "network"
  storage    = "storage"
  cicd       = "cicd"
}

workspace_working_directory_prefix = "infra"

workspace_working_directory = {
  iam        = "aws_iam"
  monitoring = "aws_monitoring"
  network    = "aws_network"
  storage    = "aws_storage"
  cicd       = "aws_cicd"
}

aws_account_id = "901371017570"

project_env = {
  prod = "prod"
  dev  = "dev"
}

notification_configuration_destination_type = "slack"
notification_configuration_enabled          = true
notification_configuration_triggers         = ["run:created", "run:planning", "run:completed", "run:errored"]

tags_iac  = "terraform"
tags_team = "personal"