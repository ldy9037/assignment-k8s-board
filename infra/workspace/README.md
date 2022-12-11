<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.30.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.30.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_organization.organization](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization) | resource |
| [tfe_organization_membership.organization_membership](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization_membership) | resource |
| [tfe_team_organization_member.team_organization_member](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_organization_member) | resource |
| [tfe_variable.aws_accesskey](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_account_id](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.aws_secret_accesskey](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.cicd_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.dns_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.dns_workspace_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.iam_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.k8s_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.monitoring_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.network_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.network_workspace_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.organization_name](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.region](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.storage_tags_environment](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tags_iac](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tags_owner](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable.tags_team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.variable_set_global](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |
| [tfe_workspace.cicd_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.dns_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.iam_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.k8s_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.monitoring_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.network_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.storage_workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_team.owners](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | AWS Access Key | `string` | n/a | yes |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_aws_secret_access_key"></a> [aws\_secret\_access\_key](#input\_aws\_secret\_access\_key) | AWS Secret Access Key | `string` | n/a | yes |
| <a name="input_github_branch"></a> [github\_branch](#input\_github\_branch) | Github branch | `string` | n/a | yes |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | Github Repository 명 | `string` | n/a | yes |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | Github username | `string` | n/a | yes |
| <a name="input_notification_configuration_destination_type"></a> [notification\_configuration\_destination\_type](#input\_notification\_configuration\_destination\_type) | 알림 채널 | `string` | n/a | yes |
| <a name="input_notification_configuration_enabled"></a> [notification\_configuration\_enabled](#input\_notification\_configuration\_enabled) | 알림 사용 여부 | `bool` | n/a | yes |
| <a name="input_notification_configuration_triggers"></a> [notification\_configuration\_triggers](#input\_notification\_configuration\_triggers) | 어떤 이벤트에 trigger 할 것인지 | `list(string)` | n/a | yes |
| <a name="input_oauth_client_service_provider"></a> [oauth\_client\_service\_provider](#input\_oauth\_client\_service\_provider) | Oauth Client service provider | `string` | n/a | yes |
| <a name="input_oauth_token_id"></a> [oauth\_token\_id](#input\_oauth\_token\_id) | Oauth Token ID | `string` | n/a | yes |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | 프로젝트 환경 | `map(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |
| <a name="input_tfc_defualt_team_name"></a> [tfc\_defualt\_team\_name](#input\_tfc\_defualt\_team\_name) | Terraform Cloud 기본 생성 팀 | `string` | n/a | yes |
| <a name="input_tfc_membership"></a> [tfc\_membership](#input\_tfc\_membership) | Terraform Cloud 사용자 | `list(string)` | n/a | yes |
| <a name="input_tfc_org"></a> [tfc\_org](#input\_tfc\_org) | Teraform Cloud Organization 이름 | `string` | n/a | yes |
| <a name="input_tfc_owner"></a> [tfc\_owner](#input\_tfc\_owner) | Terraform Cloud Organization 소유자 | `string` | n/a | yes |
| <a name="input_tfc_terraform_version"></a> [tfc\_terraform\_version](#input\_tfc\_terraform\_version) | Terraform Cloud에서 사용할 Terraform version | `string` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Terraform Cloud Workspace 이름 | `map(any)` | n/a | yes |
| <a name="input_workspace_working_directory"></a> [workspace\_working\_directory](#input\_workspace\_working\_directory) | Terraform Cloud working directory | `map(any)` | n/a | yes |
| <a name="input_workspace_working_directory_prefix"></a> [workspace\_working\_directory\_prefix](#input\_workspace\_working\_directory\_prefix) | Terraform Cloud working directory prefix | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->