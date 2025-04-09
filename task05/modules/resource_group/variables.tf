variable "name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region where the Resource Group will be deployed"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Resource Group"
  type        = map(string)
}
