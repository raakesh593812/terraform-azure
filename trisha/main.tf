provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}

# Create vnet
resource "azurerm_virtual_network" "vnet" {
    depends_on = [azurerm_resource_group.rg]
    name                = var.vnetrgname
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
   
   }

# Create subnet
resource "azurerm_subnet" "subnet" {
  depends_on = [azurerm_virtual_network.vnet]
    count = length(var.subnetname)
    name                 = var.subnetname[0+(count.index)]
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = var.vnetrgname
    address_prefix       = var.snprefix[0+(count.index)]
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
    count = length(var.nsg_name) 
    name                = format("NSG-%s", (count.index + 1))
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
       security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "nsgas" {
count = length(var.nsg_name)
  subnet_id                 = element(azurerm_subnet.subnet.*.id , count.index)
  network_security_group_id = element(azurerm_network_security_group.nsg.*.id, count.index)
}




