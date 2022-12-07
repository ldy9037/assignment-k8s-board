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