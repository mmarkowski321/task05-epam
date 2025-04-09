variable "resource_groups" {
  description = "Map of resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "App Service Plans definitions"
  type = map(object({
    name           = string
    resource_group = string
    location       = string
    sku_name       = string
    worker_count   = number
  }))
}

variable "web_apps" {
  description = "Web Apps definitions"
  type = map(object({
    name           = string
    resource_group = string
    location       = string
    plan_key       = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager config"
  type = object({
    name           = string
    location       = string
    resource_group = string
    routing_method = string
    endpoints = map(object({
      location = string
    }))
  })
}

variable "verification_ip" {
  description = "Allowed IP for verification agent"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
