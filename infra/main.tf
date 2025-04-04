resource "random_pet" "rg_name" {
  prefix = "rg"
}

module "resource_group" {
  source = "./module/azure/rg"

  name     = random_pet.rg_name.id
  location = var.location
}

resource "random_pet" "aoai" {
  prefix    = "aoaigm"
  separator = ""
}

module "azure_cognitive_account" {
  source = "./module/azure/ai"

  name     = random_pet.aoai.id
  rg_name  = module.resource_group.name
  location = var.location

  depends_on = [module.resource_group]
}

module "azure_openai_deployment_gpt" {
  source = "./module/azure/aoai_deployment"

  cognitive_account_id = module.azure_cognitive_account.id
  name                 = "gpt-4o-mini"
  model_name           = "gpt-4o-mini"
  rg_name              = module.resource_group.name
  capacity             = 2

  depends_on = [module.resource_group, module.azure_cognitive_account]
}

module "azure_openai_deployment_embedding" {
  source = "./module/azure/aoai_deployment"

  cognitive_account_id = module.azure_cognitive_account.id
  name                 = "text-embedding-3-small"
  model_name           = "text-embedding-3-small"
  model_version        = ""
  rg_name              = module.resource_group.name
  capacity             = 20

  depends_on = [module.resource_group, module.azure_cognitive_account]
}

resource "random_pet" "search" {
  prefix    = "seargm"
  separator = ""
}

module "azurerm_search_service" {
  source = "./module/azure/search"

  name     = random_pet.search.id
  rg_name  = module.resource_group.name
  location = var.location
  sku      = "free"

  depends_on = [module.resource_group]
}

resource "random_pet" "aims" {
  prefix    = "aimsgm"
  separator = ""
}

module "azure_ai_multi_service" {
  source = "./module/azure/ai"

  name     = random_pet.aims.id
  rg_name  = module.resource_group.name
  location = var.location
  kind     = "CognitiveServices"
}

resource "random_pet" "stac" {
  prefix    = "stacgm"
  separator = ""
}

module "azure_storage_account" {
  source = "./module/azure/stac"

  name     = random_pet.stac.id
  rg_name  = module.resource_group.name
  location = var.location

  depends_on = [module.resource_group]
}

module "stac_container_rag" {
  source = "./module/azure/stac/container"

  name               = "rag"
  storage_account_id = module.azure_storage_account.id
}

module "search_storage_reader" {
  source = "./module/azure/role_assignment"

  scope_id     = module.azure_storage_account.id
  principal_id = module.azurerm_search_service.identity.principal_id
  role_name    = "Storage Blob Data Reader"

  depends_on = [module.azure_storage_account, module.azurerm_search_service]
}

module "search_openai_user" {
  source = "./module/azure/role_assignment"

  scope_id     = module.azure_cognitive_account.id
  principal_id = module.azurerm_search_service.identity.principal_id
  role_name    = "Cognitive Services OpenAI User"

  depends_on = [module.azure_cognitive_account, module.azurerm_search_service]
}