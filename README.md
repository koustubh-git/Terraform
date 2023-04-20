<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advanced_security_options_internal_user_database_enabled"></a> [advanced\_security\_options\_internal\_user\_database\_enabled](#input\_advanced\_security\_options\_internal\_user\_database\_enabled) | Enable internal database for master user | `bool` | `true` | no |
| <a name="input_advanced_security_options_master_user_name"></a> [advanced\_security\_options\_master\_user\_name](#input\_advanced\_security\_options\_master\_user\_name) | Master username for Kibana | `string` | n/a | yes |
| <a name="input_advanced_security_options_master_user_password"></a> [advanced\_security\_options\_master\_user\_password](#input\_advanced\_security\_options\_master\_user\_password) | master username password | `string` | n/a | yes |
| <a name="input_assume_role"></a> [assume\_role](#input\_assume\_role) | n/a | `map(any)` | n/a | yes |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | Number of availability zone in the cluster | `number` | n/a | yes |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | The name of the Custom hostname | `string` | n/a | yes |
| <a name="input_custom_endpoint_enabled"></a> [custom\_endpoint\_enabled](#input\_custom\_endpoint\_enabled) | Enable custome endpoint | `bool` | `true` | no |
| <a name="input_dedicated_master_enabled"></a> [dedicated\_master\_enabled](#input\_dedicated\_master\_enabled) | Indicates whether dedicated master nodes are enabled for the cluster | `bool` | `false` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Name of the Domain | `string` | n/a | yes |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | EBS volumes for data storage in GB | `number` | n/a | yes |
| <a name="input_elasticsearch_version"></a> [elasticsearch\_version](#input\_elasticsearch\_version) | Version of Elasticsearch to deploy | `string` | n/a | yes |
| <a name="input_encrypt_at_rest_enabled"></a> [encrypt\_at\_rest\_enabled](#input\_encrypt\_at\_rest\_enabled) | Whether to enable encryption at rest | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of data nodes in the cluster | `number` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of the instance | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Cluster | `string` | n/a | yes |
| <a name="input_process_domain_validation_options"></a> [process\_domain\_validation\_options](#input\_process\_domain\_validation\_options) | Flag to enable/disable processing of the record to add to the DNS zone to complete certificate validation | `bool` | `true` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL of the record to add to the DNS zone to complete certificate validation | `number` | `300` | no |
| <a name="input_wait_for_certificate_issued"></a> [wait\_for\_certificate\_issued](#input\_wait\_for\_certificate\_issued) | Whether to wait for the certificate to be issued by ACM (the certificate status changed from `Pending Validation` to `Issued`) | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->