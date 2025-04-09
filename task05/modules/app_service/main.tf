resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  site_config {
    always_on                     = true
    ip_restriction_default_action = "Deny"

    dynamic "ip_restriction" {
      for_each = [
        {
          name       = "allow-ip"
          ip_address = "${var.allowed_ip_address}/32"
          priority   = 100
          action     = "Allow"
        },
        {
          name        = "allow-tm"
          service_tag = "AzureTrafficManager"
          priority    = 200
          action      = "Allow"
        }
      ]

      content {
        name     = ip_restriction.value.name
        priority = ip_restriction.value.priority
        action   = ip_restriction.value.action

        ip_address  = lookup(ip_restriction.value, "ip_address", null)
        service_tag = lookup(ip_restriction.value, "service_tag", null)
      }
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
