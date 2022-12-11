<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user_administrator"></a> [iam\_user\_administrator](#module\_iam\_user\_administrator) | terraform-aws-modules/iam/aws//modules/iam-user | 5.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_iam_user"></a> [iam\_user](#input\_iam\_user) | IAM User 목록 | `map(any)` | n/a | yes |
| <a name="input_iam_user_create_iam_access_key"></a> [iam\_user\_create\_iam\_access\_key](#input\_iam\_user\_create\_iam\_access\_key) | IAM User Access key 초기 생성 여부 | `bool` | n/a | yes |
| <a name="input_iam_user_create_login_profile"></a> [iam\_user\_create\_login\_profile](#input\_iam\_user\_create\_login\_profile) | IAM User login 허용 여부 | `bool` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->