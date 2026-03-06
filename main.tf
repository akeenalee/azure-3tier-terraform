resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-3tier-rg"
  location = var.location
}