resource "azurerm_search_service" "search_service" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku

  local_authentication_enabled = var.local_authentication_enabled
  authentication_failure_mode  = var.authentication_failure_mode

  identity {
    type = var.identity
  }
}