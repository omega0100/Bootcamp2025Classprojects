variable "resource_group_name" {
  type    = string
  default = "letsgo-Abdullah-Alotaibi"
}

variable "locations" {
  type    = list(string)
  default = ["northeurope", "westeurope"]
}

variable "acr_name" {
  type    = string
  default = "tacrmyacrabdullahalotaibi"
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}