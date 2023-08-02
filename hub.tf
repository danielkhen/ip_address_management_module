locals {
  hub_vnet_address_prefix = "10.0.0.0/16"
  hub_vpn_address_prefix  = "172.0.0.0/16"

  hub_subnets = {
    GatewaySubnet                 = cidrsubnet(local.hub_vnet_address_prefix, local.subnet_newbits, 0) #10.0.0.0/24
    AzureFirewallSubnet           = cidrsubnet(local.hub_vnet_address_prefix, local.subnet_newbits, 1) #10.0.1.0/24
    AzureFirewallManagementSubnet = cidrsubnet(local.hub_vnet_address_prefix, local.subnet_newbits, 2) #10.0.2.0/24
    ACRSubnet                     = cidrsubnet(local.hub_vnet_address_prefix, local.subnet_newbits, 3) #10.0.3.0/24
  }

  hub_private_ip_addresses = {
    firewall = cidrhost(local.subnet_address_prefixes.hub.AzureFirewallSubnet, 4) #10.1.0.4
  }
}

output "hub" {
  description = "An object containing ip addresses and prefixes of resources in the hub."
  value       = {
    vnet_address_prefix  = local.hub_vnet_address_prefix
    vpn_address_prefix   = local.hub_vpn_address_prefix
    subnet_address_prefixes              = local.hub_subnets
    private_ip_addresses = local.hub_private_ip_addresses
  }
}