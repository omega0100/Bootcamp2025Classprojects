# This file defines the settings you can change

variable "resource_group_name" {
  description = "application_1_rg"
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

# add acr credentials as variables if priviledges are not available

variable "acr_username" {
  description = "ACR admin username"
  type        = string
}

variable "acr_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
}
