# Resource Group
variable "resource_group_name" {
  type    = string
  default = "letsgo"
}

# Location
variable "location" {
  type    = string
  default = "northeurope"
}

# Container Registry name (must be globally unique)
variable "acr_name" {
  type    = string
  default = "tacrmyacr"
}

# ACR SKU: Basic, Standard, Premium
variable "acr_sku" {
  type    = string
  default = "Basic"
}
