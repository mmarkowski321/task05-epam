output "id" {
  description = "ID of the Web App"
  value       = azurerm_windows_web_app.this.id
}

output "default_hostname" {
  description = "Default FQDN of the Web App"
  value       = azurerm_windows_web_app.this.default_hostname
}
