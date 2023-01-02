tfc_org   = "emd-blog"
tfc_owner = "ldy9037@naver.com"
tfc_membership = [
]
tfc_defualt_team_name = "owners"
tfc_terraform_version = "= 1.1.7"

oauth_client_service_provider = "github"

github_username   = "ldy9037"
github_repository = "emd-blog"
github_branch     = "main"


workspace_name = {
  common = {
    iam        = "common-iam"
    monitoring = "common-monitoring"
    network    = "common-network"
    storage    = "common-storage"
    cicd       = "common-cicd"
    dns        = "common-dns"
  }
  service = {
    blog = {
      common = "service-blog-common"
      post   = "service-blog-post"
    }
  }
}

workspace_working_directory_prefix = "infra"

workspace_working_directory = {
  common = {
    iam        = "common/iam"
    monitoring = "common/monitoring"
    network    = "common/network"
    storage    = "common/storage"
    cicd       = "common/cicd"
    dns        = "common/dns"
  }
  service = {
    blog = {
      common = "service/blog/common"
      post   = "service/blog/post"
    }
  }
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