# Action Group — where alerts get sent
resource "azurerm_monitor_action_group" "main" {
  name                = "${var.prefix}-action-group"
  resource_group_name = azurerm_resource_group.main.name
  short_name          = "alliAlerts"

  email_receiver {
    name          = "admin-email"
    email_address = "alliakintola@gmail.com"
  }
}

# Alert: Container CPU > 80%
resource "azurerm_monitor_metric_alert" "cpu_high" {
  name                = "${var.prefix}-cpu-alert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_container_group.main.id]
  description         = "Alert when Container CPU exceeds 80%"
  severity            = 2
  frequency           = "PT5M"
  window_size         = "PT15M"

  criteria {
    metric_namespace = "Microsoft.ContainerInstance/containerGroups"
    metric_name      = "CpuUsage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

# Alert: Container Memory > 80%
resource "azurerm_monitor_metric_alert" "memory_high" {
  name                = "${var.prefix}-memory-alert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_container_group.main.id]
  description         = "Alert when Container memory exceeds 80%"
  severity            = 2
  frequency           = "PT5M"
  window_size         = "PT15M"

  criteria {
    metric_namespace = "Microsoft.ContainerInstance/containerGroups"
    metric_name      = "MemoryUsage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}