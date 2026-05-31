# Paramètres Azure communs pour Terraform
location = "westeurope"
resource_group_name = "rg-terraform-db"
server_name = "psql-server-demo"
administrator_login = "sqladminuser"
database_name = "mydatabase"
sku_name = "B_Gen5_1"
storage_mb = 32768
backup_retention_days = 7
version = "15"
