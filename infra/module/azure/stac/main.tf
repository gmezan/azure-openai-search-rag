resource "azurerm_storage_account" "storage_account" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication_type
  account_kind             = var.account_kind
}