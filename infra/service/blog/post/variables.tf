variable "region" {
  description = "AWS Region"
  type        = string
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

variable "organization_name" {
  description = "Organization name"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "network_workspace_name" {
  description = "Network workspace name"
  type        = string
}

variable "dns_workspace_name" {
  description = "DNS workspace name"
  type        = string
}

variable "ecr_repository_name" {
  description = "post api 용 ECR Repository 명"
  type        = string
}

variable "ecr_repository_image_tag_mutability" {
  description = "태그 변경 가능 여부"
  type        = string
}

variable "ecr_repository_lifecycle_policy" {
  description = "post api 용 ECR lifecycle 정책"
  type        = list(any)
}