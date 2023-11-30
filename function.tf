resource "azurerm_storage_account" "example" {
  name                     = "espo${random_string.azurerm_api_management_name.result}"
  resource_group_name      = data.azurerm_resource_group.SN.name
  location                 = data.azurerm_resource_group.SN.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "deployments" {
  name                  = "function-releases"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
resource "null_resource" "npm" {
  triggers = {
    requirements_md5 = "${filemd5("${path.module}/toppings/package.json")}"
  }
  provisioner "local-exec" {
    command     = "npm install"
    working_dir = "${path.module}/toppings"
  }
}

resource "azurerm_storage_blob" "appcode" {
  name                   = "functions-${substr(data.archive_file.function.output_md5, 0, 6)}.zip"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.deployments.name
  type                   = "Block"
  source                 = "./toppings.zip"
}

data "azurerm_storage_account_sas" "sas" {
  connection_string = azurerm_storage_account.example.primary_connection_string
  https_only        = true
  start             = "2019-01-01"
  expiry            = "2021-12-31"
  resource_types {
    object    = true
    container = false
    service   = false
  }
  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }
  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
    tag     = false
    filter  = false
  }

}

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = data.azurerm_resource_group.SN.name
  location            = data.azurerm_resource_group.SN.location
  os_type             = "Windows"
  sku_name            = "Y1"
}
resource "azurerm_windows_function_app" "example" {
  name                = "example-win-api-function-app"
  resource_group_name = data.azurerm_resource_group.SN.name
  location            = data.azurerm_resource_group.SN.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id
  # zip_deploy_file            = "${path.module}/toppings/toppings.zip"
  # FUNCTIONS_WORKER_RUNTIME = node
  client_certificate_mode = "Required"
  https_only              = true
  # connection_string = azurerm_storage_account.storage.primary_connection_string


  site_config {}

  app_settings = {
    https_only                   = true
    FUNCTIONS_WORKER_RUNTIME     = "node"
    WEBSITE_NODE_DEFAULT_VERSION = "~10"
    FUNCTION_APP_EDIT_MODE       = "readonly"
    # HASH                         = "${base64encode(filesha256("./${var.functionapp}"))}"
    WEBSITE_RUN_FROM_PACKAGE     = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.deployments.name}/${azurerm_storage_blob.appcode.name}${data.azurerm_storage_account_sas.sas.sas}"
  }
}

# resource "azurerm_function_app_function" "get_toppings" {
#   name            = "get-toppings-app-function"
#   function_app_id = azurerm_windows_function_app.example.id
#   language        = "Javascript"
#   test_data            = jsonencode(
#         {
#             name = "Azure"
#         }
#     )
#     file {
#     name    = "/get-toppings/index.js"
#     content = file("${path.module}/toppings/get-toppings/index.js")
#   }
#   config_json = jsonencode(
#         {
#   "bindings": [
#     {
#       "authLevel": "anonymous",
#       "type": "httpTrigger",
#       "direction": "in",
#       "name": "req",
#       "methods": [
#         "get",
#         "post"
#       ]
#     },
#     {
#       "type": "http",
#       "direction": "out",
#       "name": "res"
#     }
#   ]
# }
#     )
# }

# resource "azurerm_function_app_function" "init_toppings" {
#   name            = "init-toppings-app-function"
#   function_app_id = azurerm_windows_function_app.example.id
#   language        = "Javascript"
#   test_data            = jsonencode(
#         {
#             name = "Azure"
#         }
#     )
#     file {
#     name    = "/initialize-toppings/index.js"
#     content = file("${path.module}/toppings/initialize-toppings/index.js")
#   }
#   config_json = jsonencode(
#         {
#   "bindings": [
#     {
#       "authLevel": "anonymous",
#       "type": "httpTrigger",
#       "direction": "in",
#       "name": "req",
#       "methods": ["get"]
#     },
#     {
#       "type": "http",
#       "direction": "out",
#       "name": "res"
#     }
#   ]
# }
#     )
# }

# resource "azurerm_function_app_function" "get_topping" {
#   name            = "get-toppings-app-function"
#   function_app_id = azurerm_windows_function_app.example.id
#   language        = "Javascript"
#   test_data            = jsonencode(
#         {
#             name = "Azure"
#         }
#     )
#     file {
#     name    = "/get-topping/index.js"
#     content = file("${path.module}/toppings/get-topping/index.js")
#   }
#   config_json = jsonencode(
#         {
#   "bindings": [
#     {
#       "authLevel": "anonymous",
#       "type": "httpTrigger",
#       "direction": "in",
#       "name": "req",
#       "route": "toppings/{id}",
#       "methods": ["get"]
#     },
#     {
#       "type": "http",
#       "direction": "out",
#       "name": "res"
#     }
#   ]
# }
#     )
# }