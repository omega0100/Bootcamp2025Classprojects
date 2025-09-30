output "acr_login_servers" {
  value = { for loc, acr in azurerm_container_registry.this : loc => acr.login_server }
}

output "acr_admin_usernames" {
  value = { for loc, acr in azurerm_container_registry.this : loc => acr.admin_username }
}

output "acr_admin_passwords" {
  value     = { for loc, acr in azurerm_container_registry.this : loc => acr.admin_password }
  sensitive = true
}
