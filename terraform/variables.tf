variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
  default     = "rg-terraform-db"
}

variable "server_name" {
  description = "Azure SQL Server name"
  type        = string
  default     = "sqlserver-demo-001"
}

variable "administrator_login" {
  description = "Administrator login for SQL Server"
  type        = string
  default     = "sqladminuser"
}

variable "administrator_password" {
  description = "Administrator password for SQL Server"
  type        = string
  sensitive   = true
  default     = ""
}

variable "database_name" {
  description = "Name of the SQL Azure database to create"
  type        = string
  default     = "mydatabase"
}

variable "sku_name" {
  description = "SKU for the SQL Azure database"
  type        = string
  default     = "Standard"
}

variable "max_size_gb" {
  description = "Maximum size of the SQL Azure database in GB"
  type        = string
  default     = 250
}
