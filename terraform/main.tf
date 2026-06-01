provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mssql_server" "server" {
  name                         = var.server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "allow_azure_services"
  server_id        = azurerm_mssql_server.server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_database" "db" {
  name           = var.database_name
  server_id      = azurerm_mssql_server.server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.max_size_gb
  sku_name       = var.sku_name
  zone_redundant = false
}

output "database_name" {
  description = "The name of the created SQL Azure database"
  value       = azurerm_mssql_database.db.name
}

output "server_fqdn" {
  description = "The SQL Azure server FQDN"
  value       = azurerm_mssql_server.server.fully_qualified_domain_name
}
