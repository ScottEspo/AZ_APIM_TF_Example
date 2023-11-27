## Lookup existing Resource Group
data "azurerm_resource_group" "SN" {
  count = var.create_rg ? 0 : 1
  name  = var.rg_name
}

data "azurerm_api_management" "SN" {
  count               = var.create_apim ? 0 : 1
  name                = var.apim_name
  resource_group_name = local.resource_group_name
}

data "azurerm_api_management_product" "SN" {
  count               = var.create_product ? 0 : 1
  product_id          = var.product_name
  api_management_name = local.apim_name
  resource_group_name = local.resource_group_name
}