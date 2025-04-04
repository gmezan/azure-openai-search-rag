variable "rg_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "S0"
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "kind" {
  type    = string
  default = "OpenAI"
}