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

variable "static_contents_bucket" {
  description = "AWS Resource bucket 명"
  type        = string
}

variable "static_contents_attach_policy" {
  description = "AWS Resource bucket policy 적용 여부"
  type        = bool
}

variable "static_contents_website_index" {
  description = "AWS S3 Website index 페이지"
  type        = string
}

variable "static_contents_website_routing_rules" {
  description = "AWS S3 Website index 페이지"
  type        = list(any)
}

variable "organization_name" {
  description = "Organization name"
  type        = string
}

variable "dns_workspace_name" {
  description = "DNS workspace name"
  type        = string
}

variable "route53_record_name" {
  description = "Record 이름"
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

variable "route53_record_records" {
  description = "Record 값"
  type        = list(string)
}

variable "static_contents_acm_create" {
  description = "인증서 생성 여부"
  type        = bool
}

variable "static_contents_acm_wfv" {
  description = "인증서 생성 여부"
  type        = bool
}