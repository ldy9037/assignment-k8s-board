<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.45.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr_board"></a> [ecr\_board](#module\_ecr\_board) | terraform-aws-modules/ecr/aws | 1.5.1 |
| <a name="module_eks_alb_controller_policy"></a> [eks\_alb\_controller\_policy](#module\_eks\_alb\_controller\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.1.0 |
| <a name="module_eks_alb_controller_role"></a> [eks\_alb\_controller\_role](#module\_eks\_alb\_controller\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.9.1 |
| <a name="module_eks_board_node_role"></a> [eks\_board\_node\_role](#module\_eks\_board\_node\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.9.1 |
| <a name="module_eks_board_role"></a> [eks\_board\_role](#module\_eks\_board\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.9.1 |
| <a name="module_eks_connector_agent_policy"></a> [eks\_connector\_agent\_policy](#module\_eks\_connector\_agent\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | 5.1.0 |
| <a name="module_eks_connector_agent_role"></a> [eks\_connector\_agent\_role](#module\_eks\_connector\_agent\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | 5.9.1 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster_board](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.eks_node_group_board](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_policy.iam_policy_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.iam_policy_eks_node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.eks_alb_controller_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_node_role_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_role_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_role_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [http_http.eks_alb_controller_policy_json](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [tfe_outputs.dns_output](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |
| [tfe_outputs.network_output](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_dns_workspace_name"></a> [dns\_workspace\_name](#input\_dns\_workspace\_name) | DNS workspace name | `string` | n/a | yes |
| <a name="input_ecr_board_repository_image_tag_mutability"></a> [ecr\_board\_repository\_image\_tag\_mutability](#input\_ecr\_board\_repository\_image\_tag\_mutability) | 태그 변경 가능 여부 | `string` | n/a | yes |
| <a name="input_ecr_board_repository_lifecycle_policy"></a> [ecr\_board\_repository\_lifecycle\_policy](#input\_ecr\_board\_repository\_lifecycle\_policy) | board api 용 ECR lifecycle 정책 | `list(any)` | n/a | yes |
| <a name="input_ecr_board_repository_name"></a> [ecr\_board\_repository\_name](#input\_ecr\_board\_repository\_name) | board api 용 ECR Repository 명 | `string` | n/a | yes |
| <a name="input_eks_alb_controller_policy_description"></a> [eks\_alb\_controller\_policy\_description](#input\_eks\_alb\_controller\_policy\_description) | EKS ALB Controller 정책 설명 | `string` | n/a | yes |
| <a name="input_eks_alb_controller_policy_name"></a> [eks\_alb\_controller\_policy\_name](#input\_eks\_alb\_controller\_policy\_name) | EKS ALB Controller 정책 명 | `string` | n/a | yes |
| <a name="input_eks_alb_controller_policy_path"></a> [eks\_alb\_controller\_policy\_path](#input\_eks\_alb\_controller\_policy\_path) | EKS ALB Controller 정책 경로 | `string` | n/a | yes |
| <a name="input_eks_alb_controller_role_create_role"></a> [eks\_alb\_controller\_role\_create\_role](#input\_eks\_alb\_controller\_role\_create\_role) | EKS ALB Controller role 생성 여부 | `bool` | n/a | yes |
| <a name="input_eks_alb_controller_role_name"></a> [eks\_alb\_controller\_role\_name](#input\_eks\_alb\_controller\_role\_name) | EKS ALB Controller role 명 | `string` | n/a | yes |
| <a name="input_eks_board_cluster_name"></a> [eks\_board\_cluster\_name](#input\_eks\_board\_cluster\_name) | EKS Cluster 이름 | `string` | n/a | yes |
| <a name="input_eks_board_cluster_oicd_id"></a> [eks\_board\_cluster\_oicd\_id](#input\_eks\_board\_cluster\_oicd\_id) | Cluster OICD URL의 ID | `string` | n/a | yes |
| <a name="input_eks_board_cluster_version"></a> [eks\_board\_cluster\_version](#input\_eks\_board\_cluster\_version) | EKS Cluster 버전 | `string` | n/a | yes |
| <a name="input_eks_board_node_role_create_role"></a> [eks\_board\_node\_role\_create\_role](#input\_eks\_board\_node\_role\_create\_role) | role 생성 여부 | `bool` | n/a | yes |
| <a name="input_eks_board_node_role_name"></a> [eks\_board\_node\_role\_name](#input\_eks\_board\_node\_role\_name) | role 이름 | `string` | n/a | yes |
| <a name="input_eks_board_role_create_role"></a> [eks\_board\_role\_create\_role](#input\_eks\_board\_role\_create\_role) | role 생성 여부 | `bool` | n/a | yes |
| <a name="input_eks_board_role_name"></a> [eks\_board\_role\_name](#input\_eks\_board\_role\_name) | role 이름 | `string` | n/a | yes |
| <a name="input_eks_connector_agent_policy_description"></a> [eks\_connector\_agent\_policy\_description](#input\_eks\_connector\_agent\_policy\_description) | EKS Connector agent 정책 설명 | `string` | n/a | yes |
| <a name="input_eks_connector_agent_policy_name"></a> [eks\_connector\_agent\_policy\_name](#input\_eks\_connector\_agent\_policy\_name) | EKS Connector agent 정책 명 | `string` | n/a | yes |
| <a name="input_eks_connector_agent_policy_path"></a> [eks\_connector\_agent\_policy\_path](#input\_eks\_connector\_agent\_policy\_path) | EKS Connector agent 정책 경로 | `string` | n/a | yes |
| <a name="input_eks_connector_agent_role_create_role"></a> [eks\_connector\_agent\_role\_create\_role](#input\_eks\_connector\_agent\_role\_create\_role) | EKS Connector agent role 생성 여부 | `string` | n/a | yes |
| <a name="input_eks_connector_agent_role_name"></a> [eks\_connector\_agent\_role\_name](#input\_eks\_connector\_agent\_role\_name) | EKS Connector agent role 명 | `string` | n/a | yes |
| <a name="input_iam_policy_eks_cluster_name"></a> [iam\_policy\_eks\_cluster\_name](#input\_iam\_policy\_eks\_cluster\_name) | 관리형 EKS Cluster 정책 이름 | `string` | n/a | yes |
| <a name="input_iam_policy_eks_node_names"></a> [iam\_policy\_eks\_node\_names](#input\_iam\_policy\_eks\_node\_names) | 관리형 EKS Node 정책 이름 | `list(string)` | n/a | yes |
| <a name="input_network_workspace_name"></a> [network\_workspace\_name](#input\_network\_workspace\_name) | Network workspace name | `string` | n/a | yes |
| <a name="input_node_group_board_ami_type"></a> [node\_group\_board\_ami\_type](#input\_node\_group\_board\_ami\_type) | node group 내 node의 AMI type | `string` | n/a | yes |
| <a name="input_node_group_board_capacity_type"></a> [node\_group\_board\_capacity\_type](#input\_node\_group\_board\_capacity\_type) | node group 내 node의 capacity type | `string` | n/a | yes |
| <a name="input_node_group_board_disk_size"></a> [node\_group\_board\_disk\_size](#input\_node\_group\_board\_disk\_size) | node group 내 node의 disk size | `number` | n/a | yes |
| <a name="input_node_group_board_instance_types"></a> [node\_group\_board\_instance\_types](#input\_node\_group\_board\_instance\_types) | node group 내 node의 instance type | `list(string)` | n/a | yes |
| <a name="input_node_group_board_lt_version"></a> [node\_group\_board\_lt\_version](#input\_node\_group\_board\_lt\_version) | 노드 그룹 launch template 버전 | `string` | n/a | yes |
| <a name="input_node_group_board_name"></a> [node\_group\_board\_name](#input\_node\_group\_board\_name) | board api 노드 그룹 이름 | `string` | n/a | yes |
| <a name="input_node_group_board_sc_desired_size"></a> [node\_group\_board\_sc\_desired\_size](#input\_node\_group\_board\_sc\_desired\_size) | 노드 그룹 초기 사이즈 | `number` | n/a | yes |
| <a name="input_node_group_board_sc_max_size"></a> [node\_group\_board\_sc\_max\_size](#input\_node\_group\_board\_sc\_max\_size) | 노드 그룹 최대 사이즈 | `number` | n/a | yes |
| <a name="input_node_group_board_sc_min_size"></a> [node\_group\_board\_sc\_min\_size](#input\_node\_group\_board\_sc\_min\_size) | 노드 그룹 최소 사이즈 | `number` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->