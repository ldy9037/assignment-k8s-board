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
| <a name="module_developer_to_ssh_sg"></a> [developer\_to\_ssh\_sg](#module\_developer\_to\_ssh\_sg) | terraform-aws-modules/security-group/aws | n/a |
| <a name="module_developer_to_was_sg"></a> [developer\_to\_was\_sg](#module\_developer\_to\_was\_sg) | terraform-aws-modules/security-group/aws | n/a |
| <a name="module_githubhook_to_was_sg"></a> [githubhook\_to\_was\_sg](#module\_githubhook\_to\_was\_sg) | terraform-aws-modules/security-group/aws | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_database_subnet_group"></a> [create\_database\_subnet\_group](#input\_create\_database\_subnet\_group) | DB Subnet group 생성 여부 | `bool` | n/a | yes |
| <a name="input_database_subnets"></a> [database\_subnets](#input\_database\_subnets) | Database Subnet 대역 | `list(string)` | n/a | yes |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | NAT Gateway 허용 여부 | `bool` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private Subnet 대역 | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public Subnet 대역 | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_sg_all_egress_with_cidr_blocks"></a> [sg\_all\_egress\_with\_cidr\_blocks](#input\_sg\_all\_egress\_with\_cidr\_blocks) | Security Group egress with cidr blocks | `list(any)` | n/a | yes |
| <a name="input_sg_developer_ssh_description"></a> [sg\_developer\_ssh\_description](#input\_sg\_developer\_ssh\_description) | Security Group description | `string` | n/a | yes |
| <a name="input_sg_developer_ssh_ingress_with_cidr_blocks"></a> [sg\_developer\_ssh\_ingress\_with\_cidr\_blocks](#input\_sg\_developer\_ssh\_ingress\_with\_cidr\_blocks) | Security Group ingress with cidr blocks | `list(any)` | n/a | yes |
| <a name="input_sg_developer_ssh_name"></a> [sg\_developer\_ssh\_name](#input\_sg\_developer\_ssh\_name) | Security Group name | `string` | n/a | yes |
| <a name="input_sg_developer_was_description"></a> [sg\_developer\_was\_description](#input\_sg\_developer\_was\_description) | Security Group description | `string` | n/a | yes |
| <a name="input_sg_developer_was_ingress_with_cidr_blocks"></a> [sg\_developer\_was\_ingress\_with\_cidr\_blocks](#input\_sg\_developer\_was\_ingress\_with\_cidr\_blocks) | Security Group ingress with cidr blocks | `list(any)` | n/a | yes |
| <a name="input_sg_developer_was_name"></a> [sg\_developer\_was\_name](#input\_sg\_developer\_was\_name) | Security Group name | `string` | n/a | yes |
| <a name="input_sg_githubhook_was_description"></a> [sg\_githubhook\_was\_description](#input\_sg\_githubhook\_was\_description) | Security Group description | `string` | n/a | yes |
| <a name="input_sg_githubhook_was_ingress_with_cidr_blocks"></a> [sg\_githubhook\_was\_ingress\_with\_cidr\_blocks](#input\_sg\_githubhook\_was\_ingress\_with\_cidr\_blocks) | Security Group ingress with cidr blocks | `list(any)` | n/a | yes |
| <a name="input_sg_githubhook_was_ingress_with_ipv6_cidr_blocks"></a> [sg\_githubhook\_was\_ingress\_with\_ipv6\_cidr\_blocks](#input\_sg\_githubhook\_was\_ingress\_with\_ipv6\_cidr\_blocks) | Security Group ingress with ipv6 cidr blocks | `list(any)` | n/a | yes |
| <a name="input_sg_githubhook_was_name"></a> [sg\_githubhook\_was\_name](#input\_sg\_githubhook\_was\_name) | Security Group name | `string` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_subnet_group"></a> [database\_subnet\_group](#output\_database\_subnet\_group) | DB Subnet group ID |
| <a name="output_database_subnets"></a> [database\_subnets](#output\_database\_subnets) | Database Subnet IDs |
| <a name="output_developer_to_ssh_sg"></a> [developer\_to\_ssh\_sg](#output\_developer\_to\_ssh\_sg) | Security Group developer\_to\_ssh\_sg |
| <a name="output_developer_to_was_sg"></a> [developer\_to\_was\_sg](#output\_developer\_to\_was\_sg) | Security Group developer\_to\_was\_sg |
| <a name="output_githubhook_to_was_sg"></a> [githubhook\_to\_was\_sg](#output\_githubhook\_to\_was\_sg) | Security Group githubhook\_to\_was\_sg |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Private Subnet IDs |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Public Subnet IDs |
| <a name="output_vpc_azs"></a> [vpc\_azs](#output\_vpc\_azs) | VPC azs |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |
<!-- END_TF_DOCS -->