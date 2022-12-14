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

variable "iam_workspace_name" {
  description = "IAM workspace name"
  type        = string
}

variable "blog_common_workspace_name" {
  description = "Blog common workspace name"
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

variable "iam_policy_eks_node_names" {
  description = "관리형 EKS Node 정책 이름"
  type        = list(string)
}

variable "eks_node_role_create_role" {
  description = "role 생성 여부"
  type        = bool
}

variable "eks_node_role_name" {
  description = "role 이름"
  type        = string
}


variable "node_group_name" {
  description = "blog post api 노드 그룹 이름"
  type        = string
}

variable "node_group_lt_version" {
  description = "노드 그룹 launch template 버전"
  type        = string
}

variable "node_group_sc_desired_size" {
  description = "노드 그룹 초기 사이즈"
  type        = number
}

variable "node_group_sc_min_size" {
  description = "노드 그룹 최소 사이즈"
  type        = number
}

variable "node_group_sc_max_size" {
  description = "노드 그룹 최대 사이즈"
  type        = number
}

variable "node_group_ami_type" {
  description = "node group 내 node의 AMI type"
  type        = string
}

variable "node_group_capacity_type" {
  description = "node group 내 node의 capacity type"
  type        = string
}

variable "node_group_disk_size" {
  description = "node group 내 node의 disk size"
  type        = number
}

variable "node_group_instance_types" {
  description = "node group 내 node의 instance type"
  type        = list(string)
}

variable "ecr_push_policy_name" {
  description = "ECR Push 정책 이름"
  type        = string
}

variable "ecr_push_policy_path" {
  description = "ECR Push 정책 경로"
  type        = string
}

variable "ecr_push_policy_description" {
  description = "ECR Push 정책 설명"
  type        = string
}