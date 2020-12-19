output "tf_sto_name" {
  value = azurerm_storage_account.tf_storage_account.name
}
output "sas_url_query_string" {
  value = data.azurerm_storage_account_sas.tfstatesas.sas
}
