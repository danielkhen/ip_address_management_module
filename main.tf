locals {
  #TODO add dns zones
  vnet_address_prefixes = {
    hub     = "10.0.0.0/16"
    work    = "10.1.0.0/16"
    monitor = "10.2.0.0/16"
  }

  subnet_newbits = 8 # The number of bits which to extend the prefix of the vnet to get a subnet

  subnet_address_prefixes = {
    hub = {
      GatewaySubnet                 = cidrsubnet(local.vnet_address_prefixes.hub, local.subnet_newbits, 0)
      AzureFirewallSubnet           = cidrsubnet(local.vnet_address_prefixes.hub, local.subnet_newbits, 1)
      AzureFirewallManagementSubnet = cidrsubnet(local.vnet_address_prefixes.hub, local.subnet_newbits, 2)
      ACRSubnet                     = cidrsubnet(local.vnet_address_prefixes.hub, local.subnet_newbits, 3)
    }

    work = {
      WorkSubnet    = cidrsubnet(local.vnet_address_prefixes.work, local.subnet_newbits, 0)
      StorageSubnet = cidrsubnet(local.vnet_address_prefixes.work, local.subnet_newbits, 1)
      AKSSubnet     = cidrsubnet(local.vnet_address_prefixes.work, local.subnet_newbits, 2)
    }

    monitor = {
      MonitorSubnet = cidrsubnet(local.vnet_address_prefixes.monitor, local.subnet_newbits, 0)
    }
  }

  vpn_address_prefix = "172.0.0.0/16"

  private_ip_addresses = { #TODO maybe add public ip addresses
    firewall = cidrhost(local.subnet_address_prefixes.hub.AzureFirewallSubnet, 4)
  }
}