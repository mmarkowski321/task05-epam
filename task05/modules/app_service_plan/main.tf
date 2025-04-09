resource "azurerm_app_service_plan" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"

  sku {
    tier = split("_", var.sku)[0]
    size = var.sku
    capacity = var.worker_count
  }

  per_site_scaling = false
  reserved         = false

  tags = var.tags
}
