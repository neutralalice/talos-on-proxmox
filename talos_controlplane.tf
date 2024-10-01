resource "proxmox_virtual_environment_vm" "controlplane" {
  count = var.ctrl_num
  name = "${var.ctrl_hostname_prefix}-${count.index + 1}"
  node_name = element(data.proxmox_virtual_environment_nodes.node_info.names, count.index)
  tags = ["terraform"]

  startup {
    order = "1"
  }

  cpu {
    #    cores = var.ctrl_cores
    type = "x86-64-v3"
  }

  memory {
    dedicated = var.ctrl_memory
  }

  network_device {

  }
  dynamic "disk" {
    for_each = var.ctrl_disk
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

#data "talos_machine_configuration" "controlplane" {
#  cluster_name     = var.kubernetes_cluster_name
#  cluster_endpoint = "https://${var.talos_virtual_ip}:6443"
#
#  machine_type    = "controlplane"
#  machine_secrets = talos_machine_secrets.this.machine_secrets
#
#  talos_version      = var.talos_version
#  kubernetes_version = var.kubernetes_version
#}

#resource "talos_machine_configuration_apply" "controlplane" {
#  depends_on = [
#    proxmox_virtual_environment_vm.controlplane
#  ]
#  for_each = proxmox_virtual_environment_vm.controlplane
#  client_configuration        = talos_machine_secrets.this.client_configuration
#  machine_configuration_input = data.talos_machine_configuration.controlplane.machine_configuration
#
#  config_patches = [
#    templatefile("configs/global.yml", {
#      qemu_guest_agent_version = var.qemu_guest_agent_version
#    }),
#    templatefile("configs/controlplane.yml", {
#      talos_virtual_ip = var.talos_virtual_ip
#    }),
#    var.talos_disable_flannel ? templatefile("configs/disable_flannel.yml", {}) : null
#  ]
#}
