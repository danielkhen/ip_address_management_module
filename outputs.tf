output "vnet_address_prefixes" {
  description = "A map of the address prefixes of virtual networks."
  value       = local.vnet_address_prefixes
}

output "subnet_address_prefixes" {
  description = "A map of the address prefixes of subnets."
  value       = local.subnet_address_prefixes
}

output "vpn_address_prefix" {
  description = "The address prefix of the vpn client pool."
  value       = local.vpn_address_prefix
}

output "private_ip_addresses" {
  description = "A map of private ip addresses of specific resources."
  value       = local.private_ip_addresses
}