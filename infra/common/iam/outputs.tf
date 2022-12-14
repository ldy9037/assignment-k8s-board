output "iam_github_oidc_role_name" {
  description = "Github OIDC를 통해 사용될 역할 명"
  value       = module.iam_github_oidc_role.name
}

output "iam_github_oidc_role_arn" {
  description = "Github OIDC를 통해 사용될 역할 ARN"
  value       = module.iam_github_oidc_role.arn
}