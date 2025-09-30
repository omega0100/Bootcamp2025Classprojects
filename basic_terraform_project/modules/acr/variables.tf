variable "acr_name" {
  description = "Base name for ACR (must be unique)"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU: Basic, Standard, Premium"
  type        = string
}

variable "resource_groups" {
  description = "Map of resource groups created in root"
  type = map(object({
    name     = string
    location = string
  }))
}
