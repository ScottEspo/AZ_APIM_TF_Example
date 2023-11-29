## Lookup existing Resource Group
data "azurerm_resource_group" "SN" {
  name = var.rg_name
}

data "azurerm_windows_function_app" "toppings" {
  name                = "toppings"
  resource_group_name = var.rg_name
}