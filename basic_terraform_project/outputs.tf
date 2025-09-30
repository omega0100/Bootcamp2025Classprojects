# Resource Groups created in each location
output "resource_groups" {
  description = "Resource groups by region"
  value       = { for loc, rg in azurerm_resource_group.letsgo : loc => rg.name }
}

# ACR login servers
output "acr_login_servers" {
  description = "ACR login servers by region"
  value       = { for loc, acr in azurerm_container_registry.tacrmyacr : loc => acr.login_server }
}

# ACR admin usernames
output "acr_admin_usernames" {
  description = "ACR admin usernames by region"
  value       = { for loc, acr in azurerm_container_registry.tacrmyacr : loc => acr.admin_username }
}

# ACR admin passwords (sensitive)
output "acr_admin_passwords" {
  description = "ACR admin passwords by region"
  value       = { for loc, acr in azurerm_container_registry.tacrmyacr : loc => acr.admin_password }
  sensitive   = true
}
