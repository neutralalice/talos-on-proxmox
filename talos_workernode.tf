resource "proxmox_virtual_environment_vm" "worker_node" {
  count = var.node_num
  name = "${var.node_hostname_prefix}-${count.index + 1}"
  node_name = element(data.proxmox_virtual_environment_nodes.node_info.names, count.index)
  tags = ["terraform"]

  startup {
    order = "3"
  }

  cpu {
    type = "x86-64-v3"
  }

  memory {
    dedicated = var.node_memory
  }

  dynamic "disk" {
    for_each = var.node_disk
    content {
      file_id = proxmox_virtual_environment_file.talos_image.id
      interface = disk.value.interface
      datastore_id = disk.value.datastore_id
      size = disk.value.size
      ssd = disk.value.ssd
      file_format = "raw"
    }
  }

  provisioner "local-exec" {
    when    = destroy
    on_failure = continue
    command = "./hack/manage_nodes remove ${self.name}"
  }
}
