# Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module "azure_platform" {
  source = "../../"

  resource_group_enabled = false
  cluster_name           = var.cluster_name
  location               = var.location
  resources_group_name   = var.resources_group_name
  kubeconfig_path        = "${path.module}/.env/kubeconfig"
}

module "streamx" {
  source  = "streamx-dev/charts/helm"
  version = "0.0.1"

  cert_manager_lets_encrypt_issuer_acme_email = var.cert_manager_lets_encrypt_issuer_acme_email
  ingress_controller_nginx_settings = {
    "controller.replicaCount" : 1
    "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path" : "/healthz"
    "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal" : false
  }
  pulsar_kaap_values = [
    file("${path.module}/config/pulsar-kaap/values.yaml")
  ]
  streamx_operator_image_pull_secret_registry_email    = var.streamx_operator_image_pull_secret_registry_email
  streamx_operator_image_pull_secret_registry_password = var.streamx_operator_image_pull_secret_registry_password
  streamx_operator_chart_repository_username           = "_json_key_base64"
  streamx_operator_chart_repository_password           = var.streamx_operator_image_pull_secret_registry_password
}
