output "resource_group" {
  value = azurerm_resource_group.letsgo.name
}

output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = azurerm_container_registry.tacrmyacr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.tacrmyacr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.tacrmyacr.admin_password
  sensitive = true
}
