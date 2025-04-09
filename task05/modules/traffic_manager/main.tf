resource "azurerm_traffic_manager_profile" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "endpoints" {
  for_each = var.app_services

  name                = each.key
  profile_name        = azurerm_traffic_manager_profile.this.name
  resource_group_name = var.resource_group_name
  type                = "azureEndpoints"
  target_resource_id  = each.value.app_service_id
  endpoint_location   = each.value.location
  weight              = 100
  priority            = 1
}
