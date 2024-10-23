module "talos_image" {
  source = "./modules/talos-image"

  talos_version = "v1.8.1"
  talos_platform = "nocloud"
  talos_architecture = "amd64"
  talos_image_datastore_id = "synology"
  talos_image_datastore_nodename = "pve1"
}

module "control_planes" {
  source = "./modules/talos-node"

  num = 3
  hostname_prefix = "k8s-cp"
  tags = ["terraform"]
  startup = "1"
  cpu_cores = 2
  cpu_type = "x86-64-v3"
  memory = 5120
  disk = {
    "disk0" = { file_id = module.talos_image.talos_image_file_name, interface = "scsi0", datastore_id = "local-zfs", size = 32, ssd = true }
  }
  agent = true
}

#module "control_plane_config" {
#  source = "./modules/talos-config"
#  for_each = module.control_planes.
#}

module "worker_nodes" {
  source = "./modules/talos-node"

  num = 3
  hostname_prefix = "k8s-node"
  tags = ["terraform"]
  startup = "2"
  cpu_cores = 4
  cpu_type = "x86-64-v3"
  memory = 7168
  disk = {
    "disk0" = { file_id = module.talos_image.talos_image_file_name, interface = "scsi0", datastore_id = "local-zfs", size = 32, ssd = true }
  }
  agent = true
}

output control_plane_ip {
  value = module.control_planes.ip
}

#output worker_node_ip {
#  value = module.worker_nodes.ip
#}
