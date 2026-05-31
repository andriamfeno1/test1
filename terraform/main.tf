provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_server" "server" {
  name                = var.server_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.sku_name
  storage_mb          = var.storage_mb
  version             = var.version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  public_network_access_enabled = true
  backup_retention_days       = var.backup_retention_days
  auto_grow_enabled           = true
}

resource "azurerm_postgresql_firewall_rule" "allow_azure_services" {
  name                = "allow_azure_services"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_postgresql_server.server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

output "database_name" {
  description = "The name of the created PostgreSQL database"
  value       = azurerm_postgresql_database.db.name
}

output "server_fqdn" {
  description = "The PostgreSQL server FQDN"
  value       = azurerm_postgresql_server.server.fqdn
}
