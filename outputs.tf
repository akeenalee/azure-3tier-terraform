output "webapp_url" {
  value = "http://${azurerm_container_group.main.fqdn}"
}

output "sql_server_fqdn" {
  value     = azurerm_mssql_server.main.fully_qualified_domain_name
  sensitive = true
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}