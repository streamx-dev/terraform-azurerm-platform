<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.15.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_platform"></a> [azure\_platform](#module\_azure\_platform) | ../../ | n/a |
| <a name="module_streamx"></a> [streamx](#module\_streamx) | streamx-dev/charts/helm | 0.0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_manager_lets_encrypt_issuer_acme_email"></a> [cert\_manager\_lets\_encrypt\_issuer\_acme\_email](#input\_cert\_manager\_lets\_encrypt\_issuer\_acme\_email) | Email passed to acme server. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name. | `string` | `"streamx-example"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | `"West Europe"` | no |
| <a name="input_resources_group_name"></a> [resources\_group\_name](#input\_resources\_group\_name) | Azure resources group name. | `string` | `"streamx-example"` | no |
| <a name="input_streamx_operator_image_pull_secret_registry_email"></a> [streamx\_operator\_image\_pull\_secret\_registry\_email](#input\_streamx\_operator\_image\_pull\_secret\_registry\_email) | StreamX Operator container image registry user email. | `string` | n/a | yes |
| <a name="input_streamx_operator_image_pull_secret_registry_password"></a> [streamx\_operator\_image\_pull\_secret\_registry\_password](#input\_streamx\_operator\_image\_pull\_secret\_registry\_password) | StreamX Operator container image registry user password. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | K8s cluster kubeconfig |
| <a name="output_kubeconfig_path"></a> [kubeconfig\_path](#output\_kubeconfig\_path) | K8s cluster kubeconfig file path |
| <a name="output_kubeconfig_raw"></a> [kubeconfig\_raw](#output\_kubeconfig\_raw) | K8s cluster kubeconfig file content |
<!-- END_TF_DOCS -->