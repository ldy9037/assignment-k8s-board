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

variable "iam_group_with_policy" {
  description = "IAM Group 목록"
  type        = map(any)
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