<!-- Copyright 2025 Dynamic Solutions Sp. z o.o. sp.k.

  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~ 
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~ 
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
-->
# StreamX Platform example setup on Azure

* [development](./development) module can be used to deploy small development StreamX Platform environment
* [resource-group](./resource-group) module can be used to create Azure Resource Group when it was not provided by Azure admin
* [state-backend](./state-backend) module can be used to create Terraform state backend for [development](development) module

Follow the steps described in this document to deploy StreamX Platform environment on Azure cloud. Basic settings like location or cluster name can be adjusted via Terraform variables. All commands provided in this guide should be executed from project root directory.

## Azure Resource Group setup (Optional)

This step is required only when Azure Resource Group was not provided by Azure administrator.

1. Export [azure provider auth](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
   variables:
   ```shell
    export ARM_CLIENT_ID=
    export ARM_CLIENT_SECRET=
    export ARM_TENANT_ID=
    export ARM_SUBSCRIPTION_ID=
    ```

2. Init Terraform script
   ```shell
   terraform -chdir=examples/resource-group init
   ```
3. Apply Terraform script
   ```shell
   terraform -chdir=examples/resource-group apply
   ```

## Terraform state backend setup

This step should be executed only once. It creates Azure Storage Container with dedicated account
for Terraform state backend.

1. Export [azure provider auth](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
   variables:

   ```shell
    export ARM_CLIENT_ID=
    export ARM_CLIENT_SECRET=
    export ARM_TENANT_ID=
    export ARM_SUBSCRIPTION_ID=
   ```

2. Init Terraform script
   ```shell
   terraform -chdir=examples/state-backend init
   ```
3. Apply Terraform script
   ```shell
   terraform -chdir=examples/state-backend apply
   ```
4. Save Terraform state backend access secret returned by command. That value is required for next step (`ARM_ACCESS_KEY` environment variable).
   ```shell
   terraform -chdir=examples/state-backend output arm_access_key
   ```

## StreamX Platform setup

This step can be performed whenever a platform change is needed.

1. Export [azure provider auth](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
   variables:

   ```shell
    export ARM_CLIENT_ID=
    export ARM_CLIENT_SECRET=
    export ARM_TENANT_ID=
    export ARM_SUBSCRIPTION_ID=
   ```

2. Export StreamX secret variables:

   ```shell
   export TF_VAR_streamx_operator_image_pull_secret_registry_email=
   export TF_VAR_streamx_operator_image_pull_secret_registry_password=
   ```
   ```

3. Export email variable which is passed to Let's Encrypt for notifications:

   ```shell
   export TF_VAR_cert_manager_lets_encrypt_issuer_acme_email=
   ```

4. Export Terraform state backend connection secret:

   ```shell
   export ARM_ACCESS_KEY=
   ```

5. Init Terraform script
   ```shell
   terraform -chdir=examples/development init
   ```
6. Apply Terraform script
   ```shell
   terraform -chdir=examples/development apply
   ```