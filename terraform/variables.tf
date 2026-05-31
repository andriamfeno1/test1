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
  description = "Azure PostgreSQL server name"
  type        = string
  default     = "psql-server-demo"
}

variable "administrator_login" {
  description = "Administrator login for PostgreSQL server"
  type        = string
  default     = "sqladminuser"
}

variable "administrator_password" {
  description = "Administrator password for PostgreSQL server"
  type        = string
  sensitive   = true
  default     = ""
}

variable "database_name" {
  description = "Name of the PostgreSQL database to create"
  type        = string
  default     = "mydatabase"
}

variable "sku_name" {
  description = "SKU for the PostgreSQL server"
  type        = string
  default     = "B_Gen5_1"
}

variable "storage_mb" {
  description = "Storage size in MB for the PostgreSQL server"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "Backup retention days for PostgreSQL server"
  type        = number
  default     = 7
}

variable "version" {
  description = "PostgreSQL version"
  type        = string
  default     = "15"
}
