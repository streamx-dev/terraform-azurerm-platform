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

module "resource_group" {
  count  = var.resource_group_enabled ? 1 : 0
  source = "./modules/resource-group"

  resources_group_name = var.resources_group_name
  location             = var.location
}

module "cluster" {
  count  = var.cluster_enabled ? 1 : 0
  source = "./modules/cluster"

  cluster_name                                  = var.cluster_name
  location                                      = var.location
  resources_group_name                          = var.resource_group_enabled ? module.resource_group[0].resources_group_name : var.resources_group_name
  cluster_default_node_pool_vm_size             = var.cluster_default_node_pool_vm_size
  cluster_default_node_pool_node_count          = var.cluster_default_node_pool_node_count
  cluster_default_node_pool_node_min_count      = var.cluster_default_node_pool_node_count
  cluster_default_node_pool_node_max_count      = var.cluster_default_node_pool_node_max_count
  cluster_default_node_pool_node_max_pods       = var.cluster_default_node_pool_node_max_pods
  cluster_default_node_pool_autoscaling_enabled = var.cluster_default_node_pool_autoscaling_enabled
  kubeconfig_path                               = var.kubeconfig_path
  user_identity_id                              = var.user_identity_id
  public_ip_id                                  = var.public_ip_id
}
