variable "region" {
  description = "AWS Region"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "iam_user" {
  description = "IAM User 목록"
  type        = map(any)
}

variable "iam_user_create_iam_access_key" {
  description = "IAM User Access key 초기 생성 여부"
  type        = bool
}

variable "iam_user_create_login_profile" {
  description = "IAM User login 허용 여부"
  type        = bool
}

variable "tags_iac" {
  description = "Resource에 어떤 IaC를 사용했는지"
  type        = string
}

variable "tags_owner" {
  description = "AWS Resource의 소유자"
  type        = string
}

variable "tags_team" {
  description = "어느 팀이 관리하고 있는지"
  type        = string
}

variable "tags_environment" {
  description = "AWS Resource 환경"
  type        = string
}

variable "github_username" {
  description = "Github username or organization"
  type        = string
}

variable "github_repository" {
  description = "Github repository"
  type        = string
}

variable "github_actions_deploy_policy_name" {
  description = "Github Actions 용 deploy policy 이름"
  type        = string
}

variable "github_actions_deploy_policy_path" {
  description = "Github Actions 용 deploy policy path"
  type        = string
}

variable "github_actions_deploy_policy_description" {
  description = "Github Actions 용 deploy policy 설명"
  type        = string
}

variable "iam_github_oidc_role_name" {
  description = "Github OIDC 역할 명"
  type        = string
}