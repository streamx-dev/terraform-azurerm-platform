<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tf_state_backend"></a> [tf\_state\_backend](#module\_tf\_state\_backend) | ../../modules/state-backend | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerm_storage_container_name"></a> [azurerm\_storage\_container\_name](#input\_azurerm\_storage\_container\_name) | Azure Storage Container name. | `string` | `"streamx-example-tfstate"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure resources group name. | `string` | `"streamx-example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arm_access_key"></a> [arm\_access\_key](#output\_arm\_access\_key) | The access key created by the terraform script. To be used as `ARM_ACCESS_KEY` ENV variable for Terraform backend configuration. |
| <a name="output_tf_state_backend_config"></a> [tf\_state\_backend\_config](#output\_tf\_state\_backend\_config) | The Terraform state backend configuration that is set up to utilize a bucket created by this module. |
<!-- END_TF_DOCS -->