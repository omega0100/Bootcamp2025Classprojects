variable "resource_group_name" {
  description = "Base name for Resource Groups"
  type        = string
}

variable "locations" {
  description = "List of Azure locations to deploy into"
  type        = list(string)
}
