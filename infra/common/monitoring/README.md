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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_chatbot_slack_configuration"></a> [chatbot\_slack\_configuration](#module\_chatbot\_slack\_configuration) | waveaccounting/chatbot-slack-configuration/aws | 1.1.0 |
| <a name="module_cis_alarms"></a> [cis\_alarms](#module\_cis\_alarms) | terraform-aws-modules/cloudwatch/aws//modules/cis-alarms | ~> 3.0 |
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | ./cloudtrail-baseline | n/a |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.chatbot_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.chatbot_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.chatbot_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_sns_topic.cloudwatch_alarms_for_cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.slack](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.alarms_sns_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.chatbot_assume_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.chatbot_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS Account ID | `string` | n/a | yes |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_chatbot_enabled"></a> [chatbot\_enabled](#input\_chatbot\_enabled) | Boolean whether chatbot is enabled. | `bool` | `true` | no |
| <a name="input_chatbot_iam_role_name"></a> [chatbot\_iam\_role\_name](#input\_chatbot\_iam\_role\_name) | chatbot\_iam\_role\_name | `string` | `""` | no |
| <a name="input_chatbot_iam_role_policy_name"></a> [chatbot\_iam\_role\_policy\_name](#input\_chatbot\_iam\_role\_policy\_name) | chatbot\_iam\_role\_policy\_name | `string` | `""` | no |
| <a name="input_chatbot_logging_level"></a> [chatbot\_logging\_level](#input\_chatbot\_logging\_level) | chatbot\_logging\_level | `string` | `""` | no |
| <a name="input_cis_alarms_enabled"></a> [cis\_alarms\_enabled](#input\_cis\_alarms\_enabled) | Boolean cis alarms is enabled. | `bool` | `true` | no |
| <a name="input_cloudtrail_cloudwatch_logs_enabled"></a> [cloudtrail\_cloudwatch\_logs\_enabled](#input\_cloudtrail\_cloudwatch\_logs\_enabled) | Specifies whether the trail is delivered to CloudWatch Logs. | `bool` | `false` | no |
| <a name="input_cloudtrail_cloudwatch_logs_group_name"></a> [cloudtrail\_cloudwatch\_logs\_group\_name](#input\_cloudtrail\_cloudwatch\_logs\_group\_name) | The name of CloudWatch Logs group to which CloudTrail events are delivered. | `string` | `"cloudtrail-multi-region"` | no |
| <a name="input_cloudtrail_enabled"></a> [cloudtrail\_enabled](#input\_cloudtrail\_enabled) | Boolean whether cloudtrail is enabled. | `bool` | `true` | no |
| <a name="input_cloudtrail_iam_role_name"></a> [cloudtrail\_iam\_role\_name](#input\_cloudtrail\_iam\_role\_name) | The name of the IAM Role to be used by CloudTrail to delivery logs to CloudWatch Logs group. | `string` | `"CloudTrail-CloudWatch-Delivery-Role"` | no |
| <a name="input_cloudtrail_iam_role_policy_name"></a> [cloudtrail\_iam\_role\_policy\_name](#input\_cloudtrail\_iam\_role\_policy\_name) | The name of the IAM Role Policy to be used by CloudTrail to delivery logs to CloudWatch Logs group. | `string` | `"CloudTrail-CloudWatch-Delivery-Policy"` | no |
| <a name="input_cloudtrail_key_deletion_window_in_days"></a> [cloudtrail\_key\_deletion\_window\_in\_days](#input\_cloudtrail\_key\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days. | `number` | `10` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | The name of the trail. | `string` | `"cloudtrail-multi-region"` | no |
| <a name="input_cloudtrail_s3_bucket"></a> [cloudtrail\_s3\_bucket](#input\_cloudtrail\_s3\_bucket) | cloudtrail s3 bucket | `string` | n/a | yes |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | Number of days to retain logs for. CIS recommends 365 days. Possible values are: 0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653. Set to 0 to keep logs indefinitely. | `number` | `365` | no |
| <a name="input_cloudwatch_sns_topic_name"></a> [cloudwatch\_sns\_topic\_name](#input\_cloudwatch\_sns\_topic\_name) | sns topic name for CloudWatch alert | `string` | `""` | no |
| <a name="input_disabled_controls"></a> [disabled\_controls](#input\_disabled\_controls) | List of IDs of disabled CIS controls | `list(string)` | `[]` | no |
| <a name="input_event_selector"></a> [event\_selector](#input\_event\_selector) | Specifies an event selector for enabling data event logging. | <pre>list(object({<br>    include_management_events = bool<br>    read_write_type           = string<br><br>    data_resource = list(object({<br>      type   = string<br>      values = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | lifecycle\_rule | `any` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_s3_bucket_acl"></a> [s3\_bucket\_acl](#input\_s3\_bucket\_acl) | s3\_bucket\_acl | `string` | `"private"` | no |
| <a name="input_server_side_encryption_configuration"></a> [server\_side\_encryption\_configuration](#input\_server\_side\_encryption\_configuration) | server\_side\_encryption\_configuration | `any` | `{}` | no |
| <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id) | slack channel id | `string` | `""` | no |
| <a name="input_slack_configuration_name"></a> [slack\_configuration\_name](#input\_slack\_configuration\_name) | slack configuration name | `string` | `""` | no |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | slack\_workspace\_id | `string` | `""` | no |
| <a name="input_sns_topic_enabled"></a> [sns\_topic\_enabled](#input\_sns\_topic\_enabled) | Boolean whether chatbot is enabled. | `bool` | `true` | no |
| <a name="input_sns_topic_subscription_email"></a> [sns\_topic\_subscription\_email](#input\_sns\_topic\_subscription\_email) | sns topic subscription email | `list(string)` | `[]` | no |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | AWS Resource 환경 | `string` | n/a | yes |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Resource에 어떤 IaC를 사용했는지 | `string` | n/a | yes |
| <a name="input_tags_owner"></a> [tags\_owner](#input\_tags\_owner) | AWS Resource의 소유자 | `string` | n/a | yes |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | 어느 팀이 관리하고 있는지 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->