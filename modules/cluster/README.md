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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [local_sensitive_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_default_node_pool_node_count"></a> [cluster\_default\_node\_pool\_node\_count](#input\_cluster\_default\_node\_pool\_node\_count) | Kubernetes cluster default node pool node count. | `number` | `5` | no |
| <a name="input_cluster_default_node_pool_vm_size"></a> [cluster\_default\_node\_pool\_vm\_size](#input\_cluster\_default\_node\_pool\_vm\_size) | Kubernetes cluster default node pool VM size. | `string` | `"Standard_D2_v2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name. | `string` | n/a | yes |
| <a name="input_force_defaults_for_null_variables"></a> [force\_defaults\_for\_null\_variables](#input\_force\_defaults\_for\_null\_variables) | Enables forcing default variable values when the variable value passed to the module is null. | `bool` | `true` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | Script creates kubeconfig file with provided path. No file is created when null is provided. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resources_group_name"></a> [resources\_group\_name](#input\_resources\_group\_name) | Azure resources group name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | K8s cluster kubeconfig |
| <a name="output_kubeconfig_path"></a> [kubeconfig\_path](#output\_kubeconfig\_path) | K8s cluster kubeconfig file path |
| <a name="output_kubeconfig_raw"></a> [kubeconfig\_raw](#output\_kubeconfig\_raw) | K8s cluster kubeconfig file content |
<!-- END_TF_DOCS -->