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

### Enable/Disable sub-modules
variable "resource_group_enabled" {
  default     = true
  description = "Enables Azure Resource Group."
  type        = bool
}

variable "cluster_enabled" {
  default     = true
  description = "Enables Azure Managed Cluster."
  type        = bool
}

###
# General
###

variable "location" {
  description = "Azure location."
  type        = string
}

###
# Resource Group
###
variable "resources_group_name" {
  description = "Azure resources group name."
  type        = string
}

###
# Cluster
##

variable "cluster_name" {
  description = "Kubernetes cluster name."
  type        = string
}

variable "cluster_default_node_pool_vm_size" {
  default     = null
  description = "Kubernetes cluster default node pool VM size."
  type        = string
}

variable "cluster_default_node_pool_node_count" {
  default     = null
  description = "Kubernetes cluster default node pool node count."
  type        = number
}

variable "user_identity_id" {
  default     = null
  description = "The id of the user used by terraform to create cluster"
  type        = string
}

variable "kubeconfig_path" {
  default     = null
  description = "Script creates kubeconfig file with provided path. No file is created when null is provided."
}

variable "public_ip_id" {
  default     = null
  description = "Public ip id for kubernetes cluster"
}
