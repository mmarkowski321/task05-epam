variable "name" {
  description = "App Service Plan name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "sku" {
  description = "SKU size (e.g. P1v3)"
  type        = string
}

variable "worker_count" {
  description = "Number of workers"
  type        = number
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
