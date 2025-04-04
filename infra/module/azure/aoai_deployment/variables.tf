variable "rg_name" {
  type = string
}

variable "name" {
  type = string
}

variable "cognitive_account_id" {
  type = string
}

variable "format" {
  type    = string
  default = "OpenAI"
}

variable "model_name" {
  type    = string
  default = "gpt-4o-mini"
}

variable "model_version" {
  type    = string
  default = "2024-07-18"
}

variable "sku_name" {
  type    = string
  default = "Standard"
}

variable "capacity" {
  type    = string
  default = "1"
}

variable "policy_name" {
  type    = string
  default = "Microsoft.DefaultV2"
}