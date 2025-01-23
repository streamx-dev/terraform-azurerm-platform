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

  cluster_name                         = var.cluster_name
  location                             = var.location
  resources_group_name                 = var.resource_group_enabled ? module.resource_group[0].resources_group_name : var.resources_group_name
  cluster_default_node_pool_vm_size    = var.cluster_default_node_pool_vm_size
  cluster_default_node_pool_node_count = var.cluster_default_node_pool_node_count
  kubeconfig_path                      = var.kubeconfig_path
}
