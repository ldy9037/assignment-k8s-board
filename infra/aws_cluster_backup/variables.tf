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

variable "ecr_board_repository_name" {
  description = "board api 용 ECR Repository 명"
  type        = string
}

variable "ecr_board_repository_image_tag_mutability" {
  description = "태그 변경 가능 여부"
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

variable "node_group_board_name" {
  description = "board api 노드 그룹 이름"
  type        = string
}

variable "node_group_board_lt_version" {
  description = "노드 그룹 launch template 버전"
  type        = string
}

variable "node_group_board_sc_desired_size" {
  description = "노드 그룹 초기 사이즈"
  type        = number
}

variable "node_group_board_sc_min_size" {
  description = "노드 그룹 최소 사이즈"
  type        = number
}

variable "node_group_board_sc_max_size" {
  description = "노드 그룹 최대 사이즈"
  type        = number
}

variable "node_group_board_ami_type" {
  description = "node group 내 node의 AMI type"
  type        = string
}

variable "node_group_board_capacity_type" {
  description = "node group 내 node의 capacity type"
  type        = string
}

variable "node_group_board_disk_size" {
  description = "node group 내 node의 disk size"
  type        = number
}

variable "node_group_board_instance_types" {
  description = "node group 내 node의 instance type"
  type        = list(string)
}

variable "eks_connector_agent_policy_name" {
  description = "EKS Connector agent 정책 명"
  type        = string
}

variable "eks_connector_agent_policy_path" {
  description = "EKS Connector agent 정책 경로"
  type        = string
}

variable "eks_connector_agent_policy_description" {
  description = "EKS Connector agent 정책 설명"
  type        = string
}

variable "eks_connector_agent_role_create_role" {
  description = "EKS Connector agent role 생성 여부"
  type        = string
}

variable "eks_connector_agent_role_name" {
  description = "EKS Connector agent role 명"
  type        = string
}

variable "eks_alb_controller_policy_name" {
  description = "EKS ALB Controller 정책 명"
  type        = string
}

variable "eks_alb_controller_policy_path" {
  description = "EKS ALB Controller 정책 경로"
  type        = string
}

variable "eks_alb_controller_policy_description" {
  description = "EKS ALB Controller 정책 설명"
  type        = string
}

variable "eks_board_cluster_oicd_id" {
  description = "Cluster OICD URL의 ID"
  type        = string
}

variable "eks_alb_controller_role_create_role" {
  description = "EKS ALB Controller role 생성 여부"
  type        = bool
}

variable "eks_alb_controller_role_name" {
  description = "EKS ALB Controller role 명"
  type        = string
}