<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.46.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_static_contents"></a> [s3\_static\_contents](#module\_s3\_static\_contents) | terraform-aws-modules/s3-bucket/aws | 3.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.s3_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_iam_policy_document.allow_public_read_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tfe_outputs.dns_output](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_workspace_name"></a> [dns\_workspace\_name](#input\_dns\_workspace\_name) | DNS workspace name | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_route53_record_name"></a> [route53\_record\_name](#input\_route53\_record\_name) | Record 이름 | `string` | n/a | yes |
| <a name="input_route53_record_records"></a> [route53\_record\_records](#input\_route53\_record\_records) | Record 값 | `list(string)` | n/a | yes |
| <a name="input_route53_record_ttl"></a> [route53\_record\_ttl](#input\_route53\_record\_ttl) | Record TTL | `number` | n/a | yes |
| <a name="input_route53_record_type"></a> [route53\_record\_type](#input\_route53\_record\_type) | Record 타입 | `string` | n/a | yes |
| <a name="input_static_contents_acm_create"></a> [static\_contents\_acm\_create](#input\_static\_contents\_acm\_create) | 인증서 생성 여부 | `bool` | n/a | yes |
| <a name="input_static_contents_acm_wfv"></a> [static\_contents\_acm\_wfv](#input\_static\_contents\_acm\_wfv) | 인증서 생성 여부 | `bool` | n/a | yes |
| <a name="input_static_contents_attach_policy"></a> [static\_contents\_attach\_policy](#input\_static\_contents\_attach\_policy) | AWS Resource bucket policy 적용 여부 | `bool` | n/a | yes |
| <a name="input_static_contents_bucket"></a> [static\_contents\_bucket](#input\_static\_contents\_bucket) | AWS Resource bucket 명 | `string` | n/a | yes |
| <a name="input_static_contents_website_index"></a> [static\_contents\_website\_index](#input\_static\_contents\_website\_index) | AWS S3 Website index 페이지 | `string` | n/a | yes |
| <a name="input_static_contents_website_routing_rules"></a> [static\_contents\_website\_routing\_rules](#input\_static\_contents\_website\_routing\_rules) | AWS S3 Website index 페이지 | `list(any)` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->