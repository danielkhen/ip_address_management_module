locals {
  work_vnet_address_prefix = "10.1.0.0/16"

  work_subnets = {
    WorkSubnet    = cidrsubnet(local.work_vnet_address_prefix, local.subnet_newbits, 0) #10.1.0.0/24
    StorageSubnet = cidrsubnet(local.work_vnet_address_prefix, local.subnet_newbits, 1) #10.1.1.0/24
    AKSSubnet     = cidrsubnet(local.work_vnet_address_prefix, local.subnet_newbits, 2) #10.1.2.0/24
  }
}

output "work" {
  description = "An object containing ip addresses and prefixes of resources in the work spoke."
  value       = {
    vnet_address_prefix     = local.work_vnet_address_prefix
    subnet_address_prefixes = local.work_subnets
  }
}