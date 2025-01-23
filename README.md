<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./modules/cluster | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ./modules/resource-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_default_node_pool_node_count"></a> [cluster\_default\_node\_pool\_node\_count](#input\_cluster\_default\_node\_pool\_node\_count) | Kubernetes cluster default node pool node count. | `number` | `null` | no |
| <a name="input_cluster_default_node_pool_vm_size"></a> [cluster\_default\_node\_pool\_vm\_size](#input\_cluster\_default\_node\_pool\_vm\_size) | Kubernetes cluster default node pool VM size. | `string` | `null` | no |
| <a name="input_cluster_enabled"></a> [cluster\_enabled](#input\_cluster\_enabled) | Enables Azure Managed Cluster. | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name. | `string` | n/a | yes |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | Script creates kubeconfig file with provided path. No file is created when null is provided. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | Enables Azure Resource Group. | `bool` | `true` | no |
| <a name="input_resources_group_name"></a> [resources\_group\_name](#input\_resources\_group\_name) | Azure resources group name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | K8s cluster kubeconfig |
| <a name="output_kubeconfig_path"></a> [kubeconfig\_path](#output\_kubeconfig\_path) | K8s cluster kubeconfig file path |
| <a name="output_kubeconfig_raw"></a> [kubeconfig\_raw](#output\_kubeconfig\_raw) | K8s cluster kubeconfig file content |
<!-- END_TF_DOCS -->