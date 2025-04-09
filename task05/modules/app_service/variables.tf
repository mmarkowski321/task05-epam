variable "name" {
  description = "Name of the Windows Web App"
  type        = string
}

variable "location" {
  description = "Azure region for the Web App"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan where the Web App will be hosted"
  type        = string
}

variable "allowed_ip_address" {
  description = "Allowed IP address for verification agent"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Web App"
  type        = map(string)
}
