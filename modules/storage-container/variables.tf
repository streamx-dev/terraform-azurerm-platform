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

variable "resource_group_name" {
  description = "Azure Resource Group name."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "storage_account_name_prefix" {
  description = "Azure Storage Account name prefix."
  type        = string
}

variable "storage_account_tier" {
  default     = "Standard"
  description = "Azure Storage Account tier."
  type        = string
}

variable "storage_account_replication_type" {
  default     = "LRS"
  description = "Azure Storage Account replication type."
  type        = string
}

variable "azurerm_storage_container_name" {
  description = "Azure Storage Container name."
  type        = string
}
