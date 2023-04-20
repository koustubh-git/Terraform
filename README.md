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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_zone"></a> [zone](#module\_zone) | cloudposse/route53-cluster-zone/aws | 0.15.0 |

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app) | resource |
| [aws_amplify_branch.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_branch) | resource |
| [aws_amplify_domain_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token"></a> [access\_token](#input\_access\_token) | Access token for GitHUb | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Name of the Domain | `string` | n/a | yes |
| <a name="input_global_variables"></a> [global\_variables](#input\_global\_variables) | Variables need to stored globally. | `map(string)` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Name of the Repository | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->