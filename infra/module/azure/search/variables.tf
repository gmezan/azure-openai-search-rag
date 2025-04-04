variable "rg_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "free"
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "identity" {
  type    = string
  default = "SystemAssigned"
}

variable "authentication_failure_mode" {
  type    = string
  default = "http403"
}

variable "local_authentication_enabled" {
  type    = bool
  default = true
}