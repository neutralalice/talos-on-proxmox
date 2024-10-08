# output "node_info_names" {
#  value = data.proxmox_virtual_environment_nodes.node_info.names
#}

# alternative can be [for nodename in data.proxmox_virtual_environment_datastores : node_name.datastore_ids]
#output "datastore_ids" {
#  value = values(data.proxmox_virtual_environment_datastores.datastore_info)[*].datastore_ids
#}

