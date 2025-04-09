resource "azurerm_app_service_plan" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Windows"

  sku {
    tier     = upper(regex("^[a-zA-Z]+", var.sku))
    size     = var.sku
    capacity = var.worker_count
  }

  tags = var.tags
}
