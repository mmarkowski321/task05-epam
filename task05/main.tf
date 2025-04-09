provider "azurerm" {
  features {}
}

# Resource Groups
module "resource_groups" {
  for_each = var.resource_groups
  source   = "./modules/resource_group"

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

# App Service Plans
module "app_service_plans" {
  for_each = var.app_service_plans
  source   = "./modules/app_service_plan"

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  sku                 = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags

  depends_on = [module.resource_groups]
}

# Web Apps
module "web_apps" {
  for_each = var.web_apps
  source   = "./modules/app_service"

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group
  app_service_plan_id = module.app_service_plans[each.value.plan_key].id
  allowed_ip_address  = var.verification_ip
  tags                = var.tags

  depends_on = [module.app_service_plans]
}

# Traffic Manager
module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = var.traffic_manager.name
  location            = var.traffic_manager.location
  resource_group_name = var.traffic_manager.resource_group
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  app_services = {
    for k, v in var.traffic_manager.endpoints : k => {
      name             = k
      app_service_id   = module.web_apps[k].id
      app_service_fqdn = module.web_apps[k].default_hostname
      location         = v.location
    }
  }

  depends_on = [module.web_apps]
}
