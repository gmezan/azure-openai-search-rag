variable "rg_name" {
  type = string
}

variable "tier" {
  type    = string
  default = "Standard"
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

variable "name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus2"
}

variable "account_kind" {
  type    = string
  default = "BlobStorage"
}