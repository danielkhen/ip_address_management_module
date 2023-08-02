locals {
  monitor_vnet_address_prefix = "10.1.0.0/16"

  monitor_subnets = {
    MonitorSubnet    = cidrsubnet(local.monitor_vnet_address_prefix, local.subnet_newbits, 0) #10.2.0.0/24
  }
}

output "monitor" {
  description = "An object containing ip addresses and prefixes of resources in the monitor spoke."
  value       = {
    vnet_address_prefix = local.monitor_vnet_address_prefix
    subnet_address_prefixes             = local.monitor_subnets
  }
}