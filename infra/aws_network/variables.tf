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

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "database_subnets" {
  description = "Database Subnet 대역"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private Subnet 대역"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public Subnet 대역"
  type        = list(string)
}

variable "create_database_subnet_group" {
  description = "DB Subnet group 생성 여부"
  type        = bool
}

variable "enable_nat_gateway" {
  description = "NAT Gateway 허용 여부"
  type        = bool
}