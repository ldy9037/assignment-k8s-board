output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_azs" {
  description = "VPC azs"
  value       = module.vpc.azs
}

output "database_subnet_group" {
  description = "DB Subnet group ID"
  value       = module.vpc.database_subnet_group
}

output "database_subnets" {
  description = "Database Subnet IDs"
  value       = module.vpc.database_subnets
}

output "private_subnets" {
  description = "Private Subnet IDs"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public Subnet IDs"
  value       = module.vpc.public_subnets
}

output "developer_to_ssh_sg" {
  description = "Security Group developer_to_ssh_sg"
  value       = module.developer_to_ssh_sg.security_group_id
}

output "developer_to_was_sg" {
  description = "Security Group developer_to_was_sg"
  value       = module.developer_to_was_sg.security_group_id
}

output "githubhook_to_was_sg" {
  description = "Security Group githubhook_to_was_sg"
  value       = module.githubhook_to_was_sg.security_group_id
}