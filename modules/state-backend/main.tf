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

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstate${random_string.resource_code.result}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.azurerm_storage_container_name
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}

locals {
  terraform_state_backend_config = tomap({
    for key, tf_backend_path in var.tf_backends : key => templatefile("${path.module}/backend_template.tftpl", {
      resource_group_name  = var.resource_group_name
      storage_account_name = azurerm_storage_account.tfstate.name
      container_name       = azurerm_storage_container.tfstate.name
      key                  = key
    })
  })
  tf_backends_with_path = tomap({ for k, v in var.tf_backends : k => v if v != null })
}

resource "local_file" "tf_backend_file" {
  for_each = local.tf_backends_with_path
  filename = each.value
  content  = local.terraform_state_backend_config[each.key]
}
