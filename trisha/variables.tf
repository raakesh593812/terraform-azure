variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
}

variable "subscription_id" {
   description = "The Azure Subscription Id - found in the azure portal"
 }

variable "client_id" {
   description = "The Client Id assigned when adding the application to the authorizing Azure Active Directory Account"
 }

variable "client_secret" {
   description = "The Client Secret assigned in Azure Active Directory when adding a key"
 }

variable "tenant_id" {
   description = "The Guid assigned to the application in Azure Active Directory"
 }

variable "vnetrgname" {
   description = "The Client Secret assigned in Azure Active Directory when adding a key"
 }

variable "location" {
   description = "The Guid assigned to the application in Azure Active Directory"
 }
variable "subnetname" {
  type    = list(string)
   default = ["app"]
 }

 variable "snprefix" {
  type    = list(string)
  default = ["10.0.1.0/24"]
 }

 variable "routeprefix" {
  type    = list(string)
 
 }
  variable "route_hop_type" {
  type    = list(string)
  default = ["Internet"]
 }



variable "nsg_name" {
  type = list(string)
   description = "The Guid assigned to the application in Azure Active Directory"
 }

variable "hostname"{
description = "The Guid assigned to the application in Azure Active Directory"
}

variable "pubkey"{
description = "The Guid assigned to the application in Azure Active Directory"
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}


variable "region_ami" {
  type = map(any)
default = {
    eu-central-1   = ["ami-0ad303949e19f897a","dfg00"]
    eu-north-1     = ["ami-0d76cb8752ad73ab1"]

  }
}