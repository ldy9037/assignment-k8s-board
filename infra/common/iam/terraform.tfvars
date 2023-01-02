iam_user = {
  Administrator = [
    "ldy9037"
  ],
}

iam_user_create_iam_access_key = false
iam_user_create_login_profile  = true

github_actions_deploy_policy_name        = "GithubActionsDeployPolicy"
github_actions_deploy_policy_path        = "/"
github_actions_deploy_policy_description = "Allow s3 and ECR push"

iam_github_oidc_role_name = "GithubDeployRole"