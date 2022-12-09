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

variable "network_workspace_name" {
  description = "Network workspace name"
  type        = string
}

variable "dns_workspace_name" {
  description = "DNS workspace name"
  type        = string
}

variable "ecr_board_repository_name" {
  description = "board api 용 ECR Repository 명"
  type        = string
}

variable "ecr_board_repository_lifecycle_policy" {
  description = "board api 용 ECR lifecycle 정책"
  type        = list(any)
}

variable "iam_policy_eks_cluster_name" {
  description = "관리형 EKS Cluster 정책 이름"
  type        = string
}

variable "iam_policy_eks_node_names" {
  description = "관리형 EKS Node 정책 이름"
  type        = list(string)
}

variable "eks_board_role_create_role" {
  description = "role 생성 여부"
  type        = bool
}

variable "eks_board_role_name" {
  description = "role 이름"
  type        = string
}

variable "eks_board_node_role_create_role" {
  description = "role 생성 여부"
  type        = bool
}

variable "eks_board_node_role_name" {
  description = "role 이름"
  type        = string
}

variable "eks_board_cluster_name" {
  description = "EKS Cluster 이름"
  type        = string
}

variable "eks_board_cluster_version" {
  description = "EKS Cluster 버전"
  type        = string
}