data "proxmox_virtual_environment_nodes" "info" {}

resource "proxmox_virtual_environment_vm" "node" {
  count = var.num

  name = "${var.hostname_prefix}-${count.index + 1}"
  node_name = element(data.proxmox_virtual_environment_nodes.info.names, count.index)
  tags = var.tags

  startup {
    order = var.startup
  }

  bios            = "ovmf"
  machine         = "q35"

  operating_system {
    type = "l26"
  }

  cpu {
    cores = var.cpu_cores
    type = var.cpu_type
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge = var.bridge
  }

  dynamic "disk" {
    for_each = var.disk

    content {
      file_id = disk.value.file_id
      interface = disk.value.interface
      datastore_id = disk.value.datastore_id
      size = disk.value.size
      ssd = disk.value.ssd
      discard = "on"
      file_format = "raw"
    }
  }

  tpm_state {
    datastore_id = "local-zfs"
    version = "v2.0"
  }

  efi_disk {
    datastore_id = "local-zfs"
    type = "4m"
  }

  agent {
    enabled = var.agent
    timeout = "15s"
  }

  provisioner "local-exec" {
    when    = destroy
    on_failure = continue
    command = "./hack/manage_nodes remove ${self.name}"
  }
}
