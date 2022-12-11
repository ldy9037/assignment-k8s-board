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
| <a name="module_dynamodb_tf_lock_table"></a> [dynamodb\_tf\_lock\_table](#module\_dynamodb\_tf\_lock\_table) | terraform-aws-modules/dynamodb-table/aws | 1.2.2 |
| <a name="module_s3_log_bucket"></a> [s3\_log\_bucket](#module\_s3\_log\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.1.1 |
| <a name="module_s3_tfstate_bucket"></a> [s3\_tfstate\_bucket](#module\_s3\_tfstate\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.1.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_tfstate_lock_table_attributes"></a> [dynamodb\_tfstate\_lock\_table\_attributes](#input\_dynamodb\_tfstate\_lock\_table\_attributes) | Dynamodb table의 attributes | <pre>list(object({<br>    name = string<br>    type = string<br>  }))</pre> | n/a | yes |
| <a name="input_dynamodb_tfstate_lock_table_billing_mode"></a> [dynamodb\_tfstate\_lock\_table\_billing\_mode](#input\_dynamodb\_tfstate\_lock\_table\_billing\_mode) | Dynamodb table의 읽기 및 쓰기에 대한 결제 방식 | `string` | n/a | yes |
| <a name="input_dynamodb_tfstate_lock_table_hash_key"></a> [dynamodb\_tfstate\_lock\_table\_hash\_key](#input\_dynamodb\_tfstate\_lock\_table\_hash\_key) | Dynamodb table의 hash key | `string` | n/a | yes |
| <a name="input_dynamodb_tfstate_lock_table_name"></a> [dynamodb\_tfstate\_lock\_table\_name](#input\_dynamodb\_tfstate\_lock\_table\_name) | Dynamodb table 명 | `string` | n/a | yes |
| <a name="input_dynamodb_tfstate_lock_table_read_capacity"></a> [dynamodb\_tfstate\_lock\_table\_read\_capacity](#input\_dynamodb\_tfstate\_lock\_table\_read\_capacity) | Dynamodb table의 읽기 용량 | `number` | n/a | yes |
| <a name="input_dynamodb_tfstate_lock_table_write_capacity"></a> [dynamodb\_tfstate\_lock\_table\_write\_capacity](#input\_dynamodb\_tfstate\_lock\_table\_write\_capacity) | Dynamodb table의 쓰기 용량 | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_s3_log_bucket_acl"></a> [s3\_log\_bucket\_acl](#input\_s3\_log\_bucket\_acl) | Log용 S3 Bucket ACL | `string` | n/a | yes |
| <a name="input_s3_log_bucket_name"></a> [s3\_log\_bucket\_name](#input\_s3\_log\_bucket\_name) | Log용 S3 Bucket 명 | `string` | n/a | yes |
| <a name="input_s3_tfstate_bucket_acl"></a> [s3\_tfstate\_bucket\_acl](#input\_s3\_tfstate\_bucket\_acl) | State용 S3 Bucket의 ACL | `string` | n/a | yes |
| <a name="input_s3_tfstate_bucket_force_destroy"></a> [s3\_tfstate\_bucket\_force\_destroy](#input\_s3\_tfstate\_bucket\_force\_destroy) | S3 Bucket에 객체가 존재해도 bucket을 삭제 할 지 여부 | `string` | n/a | yes |
| <a name="input_s3_tfstate_bucket_logging_target_prefix"></a> [s3\_tfstate\_bucket\_logging\_target\_prefix](#input\_s3\_tfstate\_bucket\_logging\_target\_prefix) | S3 Bucket의 모든 로그 객체 키 접두사 | `string` | n/a | yes |
| <a name="input_s3_tfstate_bucket_logging_versioning_status"></a> [s3\_tfstate\_bucket\_logging\_versioning\_status](#input\_s3\_tfstate\_bucket\_logging\_versioning\_status) | S3 Bucket 객체의 Versioning 여부 | `string` | n/a | yes |
| <a name="input_s3_tfstate_bucket_name"></a> [s3\_tfstate\_bucket\_name](#input\_s3\_tfstate\_bucket\_name) | State용 S3 Bucket 명 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->