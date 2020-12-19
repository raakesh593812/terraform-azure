resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}
resource "azurerm_storage_account" "tf_storage_account" {
  name                     = "stotfstatetest123x"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"


}
resource "azurerm_storage_container" "tf_storage_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tf_storage_account.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "tfstatesas" {
  connection_string = azurerm_storage_account.tf_storage_account.primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2020-12-15"
  expiry = "2020-12-25"

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = true
    create  = true
    update  = true
    process = true
  }
}

