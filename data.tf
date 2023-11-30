## Lookup existing Resource Group
data "azurerm_resource_group" "SN" {
  name = var.rg_name
}

# data "azurerm_windows_function_app" "toppings" {
#   name                = "toppings"
#   resource_group_name = var.rg_name
# }

data "archive_file" "function" {
  type        = "zip"
  source_dir  = "${path.module}/toppings"
  output_path = "${path.module}/toppings.zip"

  depends_on = [null_resource.npm]
}