variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "location" {
  description = "Azure Region where the App Service Plan will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the App Service Plan will reside"
  type        = string
}

variable "sku" {
  description = "SKU (size) of the App Service Plan, e.g. P1v3"
  type        = string
}

variable "worker_count" {
  description = "Number of worker instances for the App Service Plan"
  type        = number
}

variable "tags" {
  description = "Tags to apply to the App Service Plan"
  type        = map(string)
}
