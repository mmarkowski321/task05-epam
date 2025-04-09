resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on = true
    ip_restriction {
      name       = "allow-ip"
      ip_address = var.allowed_ip_address
      priority   = 100
      action     = "Allow"
    }

    ip_restriction {
      name        = "allow-tm"
      service_tag = "AzureTrafficManager"
      priority    = 200
      action      = "Allow"
    }

    ip_restriction_default_action = "Deny"
  }

  tags = var.tags
  identity {
    type = "SystemAssigned"
  }
}
