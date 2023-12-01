resource "azurerm_storage_account" "example" {
  name                     = "espo${random_string.azurerm_api_management_name.result}"
  resource_group_name      = data.azurerm_resource_group.SN.name
  location                 = data.azurerm_resource_group.SN.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# resource "azurerm_storage_container" "deployments" {
#   name                  = "function-releases"
#   storage_account_name  = azurerm_storage_account.example.name
#   container_access_type = "private"
# }
resource "null_resource" "az_func_zip_upload" {
  triggers = {
    requirements_md5 = "${filemd5("${path.module}/toppings.zip")}"
  }
  provisioner "local-exec" {
    command     = "az functionapp deployment source config-zip -g ${data.azurerm_resource_group.SN.name} -n ${azurerm_windows_function_app.example.name} --src ${path.module}/toppings2.zip"
    working_dir = "${path.module}"
  }
  depends_on = [ azurerm_windows_function_app.example ]
}

# resource "azurerm_storage_blob" "appcode" {
#   name                   = "functions-${substr(data.archive_file.function.output_md5, 0, 6)}.zip"
#   storage_account_name   = azurerm_storage_account.example.name
#   storage_container_name = azurerm_storage_container.deployments.name
#   type                   = "Block"
#   source                 = "./toppings.zip"
# }

# data "azurerm_storage_account_sas" "sas" {
#   connection_string = azurerm_storage_account.example.primary_connection_string
#   https_only        = true
#   start             = "2023-11-01"
#   expiry            = "2023-12-31"
#   resource_types {
#     object    = true
#     container = false
#     service   = false
#   }
#   services {
#     blob  = true
#     queue = false
#     table = false
#     file  = false
#   }
#   permissions {
#     read    = true
#     write   = false
#     delete  = false
#     list    = false
#     add     = false
#     create  = false
#     update  = false
#     process = false
#     tag     = false
#     filter  = false
#   }

# }

resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = data.azurerm_resource_group.SN.name
  location            = data.azurerm_resource_group.SN.location
  os_type             = "Windows"
  sku_name            = "Y1"
}
resource "azurerm_windows_function_app" "example" {
  name                = "espo-pizza-toppings-app"
  resource_group_name = data.azurerm_resource_group.SN.name
  location            = data.azurerm_resource_group.SN.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id
  # zip_deploy_file            = "${path.module}/toppings2.zip"
  # FUNCTIONS_WORKER_RUNTIME = node
  client_certificate_mode = "Required"
  https_only              = true
  # connection_string = azurerm_storage_account.storage.primary_connection_string
  functions_extension_version = "~4"
  


  site_config {
    cors {
      allowed_origins = [
        "*",
      "https://portal.azure.com"]
    }
  }

  app_settings = {
    https_only               = true
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_NODE_DEFAULT_VERSION = "~20"
    # FUNCTION_APP_EDIT_MODE       = "readonly"
    # HASH                         = "${base64encode(filesha256("./${var.functionapp}"))}"
    # WEBSITE_RUN_FROM_PACKAGE     = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.deployments.name}/${azurerm_storage_blob.appcode.name}${data.azurerm_storage_account_sas.sas.sas}" # ${data.azurerm_storage_account_sas.sas.sas}
    WEBSITE_RUN_FROM_PACKAGE  = "0"
    WEBSITE_DISABLE_ZIP_CACHE = "0"
    COSMOS_CONNECTION_STRING = "${azurerm_cosmosdb_account.pizza_db_acct.connection_strings[0]}"
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