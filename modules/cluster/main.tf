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

locals {
  default_resources_group_name                          = "streamx-commerce-accelerator"
  default_location                                      = "West Europe"
  default_cluster_name                                  = "streamx-commerce-accelerator"
  default_cluster_default_node_pool_vm_size             = "Standard_D2_v2"
  default_cluster_default_node_pool_node_count          = 5
  default_cluster_default_node_pool_node_max_count      = 8
  default_cluster_default_node_pool_node_min_count      = 3
  default_cluster_default_node_pool_node_max_pods       = 60
  default_cluster_default_node_pool_autoscaling_enabled = true

  resources_group_name                          = var.force_defaults_for_null_variables && var.resources_group_name == null ? local.default_resources_group_name : var.resources_group_name
  location                                      = var.force_defaults_for_null_variables && var.location == null ? local.default_location : var.location
  cluster_name                                  = var.force_defaults_for_null_variables && var.cluster_name == null ? local.default_cluster_name : var.cluster_name
  cluster_default_node_pool_vm_size             = var.force_defaults_for_null_variables && var.cluster_default_node_pool_vm_size == null ? local.default_cluster_default_node_pool_vm_size : var.cluster_default_node_pool_vm_size
  cluster_default_node_pool_node_count          = var.force_defaults_for_null_variables && var.cluster_default_node_pool_node_count == null ? local.default_cluster_default_node_pool_node_count : var.cluster_default_node_pool_node_count
  cluster_default_node_pool_node_max_count      = var.force_defaults_for_null_variables && var.cluster_default_node_pool_node_max_count == null ? local.default_cluster_default_node_pool_node_max_count : var.cluster_default_node_pool_node_max_count
  cluster_default_node_pool_node_min_count      = var.force_defaults_for_null_variables && var.cluster_default_node_pool_node_min_count == null ? local.default_cluster_default_node_pool_node_min_count : var.cluster_default_node_pool_node_min_count
  cluster_default_node_pool_node_max_pods       = var.force_defaults_for_null_variables && var.cluster_default_node_pool_node_max_pods == null ? local.default_cluster_default_node_pool_node_max_pods : var.cluster_default_node_pool_node_max_pods
  cluster_default_node_pool_autoscaling_enabled = var.force_defaults_for_null_variables && var.cluster_default_node_pool_autoscaling_enabled == null ? local.default_cluster_default_node_pool_autoscaling_enabled : var.cluster_default_node_pool_autoscaling_enabled

}

resource "azurerm_kubernetes_cluster" "cluster" {
  location            = local.location
  name                = local.cluster_name
  resource_group_name = local.resources_group_name

  dns_prefix = local.cluster_name

  default_node_pool {
    name                 = "default"
    node_count           = local.cluster_default_node_pool_node_count
    vm_size              = local.cluster_default_node_pool_vm_size
    auto_scaling_enabled = local.cluster_default_node_pool_autoscaling_enabled
    max_pods             = local.cluster_default_node_pool_node_max_pods
    min_count            = local.cluster_default_node_pool_node_min_count
    max_count            = local.cluster_default_node_pool_node_max_count


    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type         = var.user_identity_id != null && var.user_identity_id != "" ? "UserAssigned" : "SystemAssigned"
    identity_ids = var.user_identity_id != null && var.user_identity_id != "" ? [var.user_identity_id] : null
  }

  dynamic "network_profile" {
    for_each = var.public_ip_id != null && var.public_ip_id != "" ? [1] : []
    content {
      network_plugin    = "azure"
      load_balancer_sku = "standard"

      load_balancer_profile {
        outbound_ip_address_ids = [var.public_ip_id]
      }
    }
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}

resource "local_sensitive_file" "kubeconfig" {
  count    = var.kubeconfig_path == null ? 0 : 1
  filename = var.kubeconfig_path
  content  = azurerm_kubernetes_cluster.cluster.kube_config_raw
}
