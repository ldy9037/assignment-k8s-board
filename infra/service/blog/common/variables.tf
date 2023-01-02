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

variable "eks_cluster_name" {
  description = "Blog Cluster 이름"
  type        = string
}

variable "eks_cluster_version" {
  description = "Blog Cluster 버전"
  type        = string
}

variable "iam_policy_eks_cluster_name" {
  description = "EKS IAM 정책"
  type        = string
}

variable "eks_cluster_role_create_role" {
  description = "EKS Role 생성 여부"
  type        = string
}

variable "eks_cluster_role_name" {
  description = "EKS Role 이름"
  type        = string
}
