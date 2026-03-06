resource "azurerm_container_group" "main" {
  name                = "${var.prefix}-container-app"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  dns_name_label      = "${var.prefix}-3tier-app"
  os_type             = "Linux"

  container {
    name   = "webapp"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      "DB_SERVER" = azurerm_mssql_server.main.fully_qualified_domain_name
      "DB_NAME"   = azurerm_mssql_database.main.name
    }
  }

  tags = {
    environment = "learning"
    project     = "3tier-iac"
  }
}