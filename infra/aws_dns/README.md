<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.12.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53"></a> [route53](#module\_route53) | terraform-aws-modules/route53/aws//modules/zones | 2.10.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_route53_zones"></a> [route53\_zones](#input\_route53\_zones) | zones | `map(any)` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_zones_id"></a> [route53\_zones\_id](#output\_route53\_zones\_id) | route53 host zone id |
| <a name="output_route53_zones_name"></a> [route53\_zones\_name](#output\_route53\_zones\_name) | route53 host zone name |
<!-- END_TF_DOCS -->