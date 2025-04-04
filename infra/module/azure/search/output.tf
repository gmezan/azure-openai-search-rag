output "name" {
  value = azurerm_search_service.search_service.name
}

output "identity" {
  value = azurerm_search_service.search_service.identity[0]
}