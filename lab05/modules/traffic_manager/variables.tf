variable "name" {
  description = "Name of the Traffic Manager profile"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for the Traffic Manager"
  type        = string
}

variable "location" {
  description = "Azure region (required even though TM is global)"
  type        = string
}

variable "routing_method" {
  description = "Routing method: Performance, Priority, etc."
  type        = string
}

variable "app_services" {
  description = "Map of App Services to register as TM endpoints"
  type = map(object({
    name             = string
    app_service_id   = string
    app_service_fqdn = string
    location         = string
  }))
}

variable "tags" {
  description = "Tags to apply to Traffic Manager profile"
  type        = map(string)
}
