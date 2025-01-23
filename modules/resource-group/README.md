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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resources_group_name"></a> [resources\_group\_name](#input\_resources\_group\_name) | Azure resources group name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources_group_id"></a> [resources\_group\_id](#output\_resources\_group\_id) | Created resources group id |
| <a name="output_resources_group_location"></a> [resources\_group\_location](#output\_resources\_group\_location) | Created resources group location |
| <a name="output_resources_group_name"></a> [resources\_group\_name](#output\_resources\_group\_name) | Created resources group name |
<!-- END_TF_DOCS -->