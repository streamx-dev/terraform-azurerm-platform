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
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../../modules/resource-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Azure resources group name. | `string` | `"streamx-example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources_group_id"></a> [resources\_group\_id](#output\_resources\_group\_id) | Created resources group id |
| <a name="output_resources_group_location"></a> [resources\_group\_location](#output\_resources\_group\_location) | Created resources group location |
| <a name="output_resources_group_name"></a> [resources\_group\_name](#output\_resources\_group\_name) | Created resources group name |
<!-- END_TF_DOCS -->