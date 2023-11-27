locals {
  resource_group_name = var.create_rg ? var.rg_name : data.azurerm_resource_group.SN[0].name
  rg_location         = var.create_rg ? var.resource_group_location : data.azurerm_resource_group.SN[0].location
  apim_name           = var.create_apim ? "apiservice${random_string.azurerm_api_management_name.result}" : data.azurerm_api_management.SN[0].name
  apim_location       = var.create_apim ? var.resource_group_location : data.azurerm_api_management.SN[0].location
  product_id          = var.create_product ? replace(var.product_name, "/\\s+/", "_") : data.azurerm_api_management_product.SN[0].product_id
}