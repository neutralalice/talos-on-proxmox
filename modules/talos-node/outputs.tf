output "ip" {
  value = [for node in proxmox_virtual_environment_vm.node : {
    ipv4 = element(element(node.ipv4_addresses, index(node.network_interface_names, "eth0")), 0)
    ipv6 = element(node.ipv6_addresses, index(node.network_interface_names, "eth0"))
  }]
}
