# output "resource_group_name" {
#   value = azurerm_resource_group.rg_pet.name
# }

# output "api_management_service_name" {
#   value = azurerm_api_management.api.name
# }

output "cosmosdb_connectionstrings" {
  value     = azurerm_cosmosdb_account.pizza_db_acct.connection_strings
  sensitive = true
}

output "init_toppings" {
  value = "${azurerm_api_management_api.example_manual.service_url}${azurerm_api_management_api_operation.initiate_operation.url_template}"
}

output "get_toppings" {
  value = "${azurerm_api_management_api.example_manual.service_url}${azurerm_api_management_api_operation.example.url_template}"
}