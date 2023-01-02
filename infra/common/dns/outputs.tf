output "route53_zones_id" {
  description = "route53 host zone id"
  value       = module.route53.route53_zone_zone_id
}

output "route53_zones_name" {
  description = "route53 host zone name"
  value       = module.route53.route53_zone_name
}