# resource "azurerm_storage_account" "example" {
#   name                     = "windowsfunctionappsa"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_service_plan" "example" {
#   name                = "example-app-service-plan"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   os_type             = "Windows"
#   sku_name            = "Y1"
# }

# resource "azurerm_windows_function_app" "example" {
#   name                = "example-windows-function-app"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location

#   storage_account_name       = azurerm_storage_account.example.name
#   storage_account_access_key = azurerm_storage_account.example.primary_access_key
#   service_plan_id            = azurerm_service_plan.example.id

#   site_config {}
# }

# resource "azurerm_windows_function_app" "import" {
#     # terraform import azurerm_windows_function_app.import /subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/sites/toppings
#     app_settings                                   = {}
#     builtin_logging_enabled                        = false
#     client_certificate_enabled                     = false
#     client_certificate_mode                        = "Required"
#     content_share_force_disabled                   = false
#     custom_domain_verification_id                  = (sensitive value)
#     daily_memory_time_quota                        = 0
#     default_hostname                               = "toppings.azurewebsites.net"
#     enabled                                        = true
#     ftp_publish_basic_authentication_enabled       = true
#     functions_extension_version                    = "~4"
#     https_only                                     = true
#     id                                             = "/subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/sites/toppings"
#     key_vault_reference_identity_id                = "SystemAssigned"
#     kind                                           = "functionapp"
#     location                                       = "eastus"
#     name                                           = "toppings"
#     outbound_ip_address_list                       = [
#         "52.142.39.114",
#         "52.149.171.172",
#         "52.149.245.55",
#         "52.149.245.80",
#         "52.149.246.123",
#         "40.71.237.11",
#         "20.119.0.27",
#     ]
#     outbound_ip_addresses                          = "52.142.39.114,52.149.171.172,52.149.245.55,52.149.245.80,52.149.246.123,40.71.237.11,20.119.0.27"
#     possible_outbound_ip_address_list              = [
#         "52.142.39.114",
#         "52.149.171.172",
#         "52.149.245.55",
#         "52.149.245.80",
#         "52.149.246.123",
#         "40.71.237.11",
#         "40.71.237.149",
#         "52.149.247.26",
#         "52.149.247.158",
#         "52.149.171.242",
#         "52.152.192.17",
#         "52.152.192.112",
#         "52.152.192.231",
#         "52.151.234.34",
#         "52.152.194.37",
#         "52.152.196.7",
#         "52.152.196.130",
#         "52.142.34.90",
#         "52.152.197.11",
#         "52.152.198.42",
#         "52.152.198.93",
#         "52.142.38.224",
#         "40.71.235.143",
#         "52.152.198.150",
#         "52.152.199.149",
#         "52.152.199.235",
#         "52.179.112.33",
#         "52.151.239.247",
#         "52.179.112.188",
#         "52.179.112.209",
#         "20.119.0.27",
#     ]
#     possible_outbound_ip_addresses                 = "52.142.39.114,52.149.171.172,52.149.245.55,52.149.245.80,52.149.246.123,40.71.237.11,40.71.237.149,52.149.247.26,52.149.247.158,52.149.171.242,52.152.192.17,52.152.192.112,52.152.192.231,52.151.234.34,52.152.194.37,52.152.196.7,52.152.196.130,52.142.34.90,52.152.197.11,52.152.198.42,52.152.198.93,52.142.38.224,40.71.235.143,52.152.198.150,52.152.199.149,52.152.199.235,52.179.112.33,52.151.239.247,52.179.112.188,52.179.112.209,20.119.0.27"
#     public_network_access_enabled                  = true
#     resource_group_name                            = "1-e367fa9f-playground-sandbox"
#     service_plan_id                                = "/subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/serverfarms/ASP-1e367fa9fplaygroundsandbox-bfbf"
#     site_credential                                = (sensitive value)
#     storage_account_access_key                     = (sensitive value)
#     storage_account_name                           = "1e367fa9fplaygrounda602"
#     storage_uses_managed_identity                  = false
#     tags                                           = {}
#     webdeploy_publish_basic_authentication_enabled = true

#     site_config {
#         always_on                         = false
#         app_scale_limit                   = 200
#         default_documents                 = [
#             "Default.htm",
#             "Default.html",
#             "Default.asp",
#             "index.htm",
#             "index.html",
#             "iisstart.htm",
#             "default.aspx",
#             "index.php",
#         ]
#         detailed_error_logging_enabled    = false
#         elastic_instance_minimum          = 0
#         ftps_state                        = "FtpsOnly"
#         health_check_eviction_time_in_min = 0
#         http2_enabled                     = false
#         load_balancing_mode               = "LeastRequests"
#         managed_pipeline_mode             = "Integrated"
#         minimum_tls_version               = "1.2"
#         pre_warmed_instance_count         = 0
#         remote_debugging_enabled          = false
#         runtime_scale_monitoring_enabled  = false
#         scm_minimum_tls_version           = "1.2"
#         scm_type                          = "None"
#         scm_use_main_ip_restriction       = false
#         use_32_bit_worker                 = true
#         vnet_route_all_enabled            = false
#         websockets_enabled                = false
#         worker_count                      = 1

#         application_stack {
#             dotnet_version              = "v6.0"
#             node_version                = "~18"
#             use_custom_runtime          = false
#             use_dotnet_isolated_runtime = false
#         }

#         cors {
#             allowed_origins     = [
#                 "https://portal.azure.com",
#             ]
#             support_credentials = false
#         }
#     }


# }



# resource "azurerm_function_app_function" "example" {
#   name            = "example-function-app-function"
#   function_app_id = azurerm_linux_function_app.example.id
#   language        = "Python"
#   test_data = jsonencode({
#     "name" = "Azure"
#   })
#   config_json = jsonencode({
#     "bindings" = [
#       {
#         "authLevel" = "function"
#         "direction" = "in"
#         "methods" = [
#           "get",
#           "post",
#         ]
#         "name" = "req"
#         "type" = "httpTrigger"
#       },
#       {
#         "direction" = "out"
#         "name"      = "$return"
#         "type"      = "http"
#       },
#     ]
#   })
# }
# resource "azurerm_function_app_function" "example" {
#   name            = "example-function-app-function"
#   function_app_id = azurerm_windows_function_app.example.id
#   language        = "CSharp"

#   file {
#     name    = "run.csx"
#     content = file("exampledata/run.csx")
#   }

#   test_data = jsonencode({
#     "name" = "Azure"
#   })

#   config_json = jsonencode({
#     "bindings" = [
#       {
#         "authLevel" = "function"
#         "direction" = "in"
#         "methods" = [
#           "get",
#           "post",
#         ]
#         "name" = "req"
#         "type" = "httpTrigger"
#       },
#       {
#         "direction" = "out"
#         "name"      = "$return"
#         "type"      = "http"
#       },
#     ]
#   })
# }


# resource "azurerm_function_app_function" "import_get_toppings" {

# # terraform import azurerm_function_app_function.import_get_toppings "/subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd88328e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/sites/toppings/functions/get-toppings"
#     config_json          = jsonencode(
#         {
#             bindings = [
#                 {
#                     authLevel = "anonymous"
#                     direction = "in"
#                     methods   = [
#                         "get",
#                         "post",
#                     ]
#                     name      = "req"
#                     type      = "httpTrigger"
#                 },
#                 {
#                     direction = "out"
#                     name      = "res"
#                     type      = "http"
#                 },
#             ]
#         }
#     )
#     config_url           = "https://toppings.azurewebsites.net/admin/vfs/site/wwwroot/get-toppings/function.json"
#     enabled              = true
#     function_app_id      = "/subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd88328e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/sites/toppings"
#     id                   = "/subscriptions/28e1e42a-4438-4c30-9a5f-7d7b488fd88328e1e42a-4438-4c30-9a5f-7d7b488fd883/resourceGroups/1-e367fa9f-playground-sandbox/providers/Microsoft.Web/sites/toppings/functions/get-toppings"
#     invocation_url       = "https://toppings.azurewebsites.net/api/get-toppings"
#     name                 = "get-toppings"
#     script_root_path_url = "https://toppings.azurewebsites.net/admin/vfs/site/wwwroot/get-toppings/"
#     script_url           = "https://toppings.azurewebsites.net/admin/vfs/site/wwwroot/get-toppings/index.js"   
#     test_data            = jsonencode(
#         {
#             name = "Azure"
#         }
#     )
#     test_data_url        = "https://toppings.azurewebsites.net/admin/vfs/data/Functions/sampledata/get-toppings.dat"
#     url                  = "https://toppings.azurewebsites.net/admin/functions/get-toppings"
# }