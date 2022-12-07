output "route53_zones_name" {
  description = "route53 host zone"
  value       = keys(module.zones.route53_zone_zone_id)[0]
}