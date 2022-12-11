<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.11.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_jenkins"></a> [ec2\_jenkins](#module\_ec2\_jenkins) | terraform-aws-modules/ec2-instance/aws | ~> 3.0 |
| <a name="module_iam_group_jenkins"></a> [iam\_group\_jenkins](#module\_iam\_group\_jenkins) | terraform-aws-modules/iam/aws//modules/iam-group-with-policies | n/a |
| <a name="module_iam_user_jenkins"></a> [iam\_user\_jenkins](#module\_iam\_user\_jenkins) | terraform-aws-modules/iam/aws//modules/iam-user | 5.1.0 |
| <a name="module_jenkins_deploy_policy"></a> [jenkins\_deploy\_policy](#module\_jenkins\_deploy\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip_jenkins](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [tfe_outputs.dns_output](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |
| [tfe_outputs.network_output](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_workspace_name"></a> [dns\_workspace\_name](#input\_dns\_workspace\_name) | DNS workspace name | `string` | n/a | yes |
| <a name="input_ec2_jenkins_ami"></a> [ec2\_jenkins\_ami](#input\_ec2\_jenkins\_ami) | EC2 instance name | `string` | n/a | yes |
| <a name="input_ec2_jenkins_instance_type"></a> [ec2\_jenkins\_instance\_type](#input\_ec2\_jenkins\_instance\_type) | EC2 instance type | `string` | n/a | yes |
| <a name="input_ec2_jenkins_name"></a> [ec2\_jenkins\_name](#input\_ec2\_jenkins\_name) | EC2 instance name | `string` | n/a | yes |
| <a name="input_environment_use"></a> [environment\_use](#input\_environment\_use) | 환경 구성 여부 | `bool` | n/a | yes |
| <a name="input_iam_group_jenkins_create_group"></a> [iam\_group\_jenkins\_create\_group](#input\_iam\_group\_jenkins\_create\_group) | IAM Group 생성 여부 | `bool` | n/a | yes |
| <a name="input_iam_group_jenkins_name"></a> [iam\_group\_jenkins\_name](#input\_iam\_group\_jenkins\_name) | IAM Group 이름 | `string` | n/a | yes |
| <a name="input_iam_user_jenkins_create_iam_access_key"></a> [iam\_user\_jenkins\_create\_iam\_access\_key](#input\_iam\_user\_jenkins\_create\_iam\_access\_key) | IAM User Access key 초기 생성 여부 | `bool` | n/a | yes |
| <a name="input_iam_user_jenkins_create_login_profile"></a> [iam\_user\_jenkins\_create\_login\_profile](#input\_iam\_user\_jenkins\_create\_login\_profile) | IAM User login 허용 여부 | `bool` | n/a | yes |
| <a name="input_iam_user_jenkins_name"></a> [iam\_user\_jenkins\_name](#input\_iam\_user\_jenkins\_name) | Jenkins Service 계정 | `string` | n/a | yes |
| <a name="input_jenkins_deploy_policy_description"></a> [jenkins\_deploy\_policy\_description](#input\_jenkins\_deploy\_policy\_description) | Jenkins 용 deploy policy 설명 | `string` | n/a | yes |
| <a name="input_jenkins_deploy_policy_name"></a> [jenkins\_deploy\_policy\_name](#input\_jenkins\_deploy\_policy\_name) | Jenkins 용 deploy policy 이름 | `string` | n/a | yes |
| <a name="input_jenkins_deploy_policy_path"></a> [jenkins\_deploy\_policy\_path](#input\_jenkins\_deploy\_policy\_path) | Jenkins 용 deploy policy path | `string` | n/a | yes |
| <a name="input_network_workspace_name"></a> [network\_workspace\_name](#input\_network\_workspace\_name) | Network workspace name | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_route53_record_ttl"></a> [route53\_record\_ttl](#input\_route53\_record\_ttl) | Record TTL | `number` | n/a | yes |
| <a name="input_route53_record_type"></a> [route53\_record\_type](#input\_route53\_record\_type) | Record 타입 | `string` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->