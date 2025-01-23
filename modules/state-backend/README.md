<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.15.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [local_file.tf_backend_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.resource_code](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_container_name"></a> [azurerm\_storage\_container\_name](#input\_azurerm\_storage\_container\_name) | Azure Storage Container name. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure Resource Group name. | `string` | n/a | yes |
| <a name="input_tf_backend_file_path"></a> [tf\_backend\_file\_path](#input\_tf\_backend\_file\_path) | Terraform backend file path. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arm_access_key"></a> [arm\_access\_key](#output\_arm\_access\_key) | The access key created by the terraform script. To be used as `ARM_ACCESS_KEY` ENV variable for Terraform backend configuration. |
| <a name="output_tf_state_backend_config"></a> [tf\_state\_backend\_config](#output\_tf\_state\_backend\_config) | The Terraform state backend configuration that is set up to utilize a bucket created by this module. |
<!-- END_TF_DOCS -->