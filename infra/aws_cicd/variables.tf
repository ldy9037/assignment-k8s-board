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

variable "environment_use" {
  description = "환경 구성 여부"
  type        = bool
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

variable "ec2_jenkins_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ec2_jenkins_ami" {
  description = "EC2 instance name"
  type        = string
}

variable "ec2_jenkins_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "iam_user_jenkins_name" {
  description = "Jenkins Service 계정"
  type        = string
}

variable "iam_user_jenkins_create_iam_access_key" {
  description = "IAM User Access key 초기 생성 여부"
  type        = bool
}

variable "iam_user_jenkins_create_login_profile" {
  description = "IAM User login 허용 여부"
  type        = bool
}

variable "iam_group_jenkins_name" {
  description = "IAM Group 이름"
  type        = string
}

variable "iam_group_jenkins_create_group" {
  description = "IAM Group 생성 여부"
  type        = bool
}

variable "jenkins_deploy_policy_name" {
  description = "Jenkins 용 deploy policy 이름"
  type        = string
}

variable "jenkins_deploy_policy_path" {
  description = "Jenkins 용 deploy policy path"
  type        = string
}

variable "jenkins_deploy_policy_description" {
  description = "Jenkins 용 deploy policy 설명"
  type        = string
}

variable "route53_record_type" {
  description = "Record 타입"
  type        = string
}

variable "route53_record_ttl" {
  description = "Record TTL"
  type        = number
}