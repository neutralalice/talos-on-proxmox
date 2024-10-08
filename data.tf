data "proxmox_virtual_environment_nodes" "info" {}

#data "proxmox_virtual_environment_datastores" "info" {
#  for_each = toset(data.proxmox_virtual_environment_nodes.node_info.names)
#  node_name = each.value
#}
