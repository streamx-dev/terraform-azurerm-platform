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

output "resources_group_id" {
  description = "Created resources group id"
  value       = azurerm_resource_group.rg.id
}

output "resources_group_name" {
  description = "Created resources group name"
  value       = azurerm_resource_group.rg.name
}

output "resources_group_location" {
  description = "Created resources group location"
  value       = azurerm_resource_group.rg.location
}
