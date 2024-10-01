locals {
  talos_iso_file_name = "talos-${var.talos_version}-nocloud-amd64.iso"
  talos_xz_file_name = "talos-${var.talos_version}-nocloud-amd64.iso.xz"
  talos_image_path = "/mnt/pve/${var.talos_image_datastore_id}/template/iso"
}

resource "proxmox_virtual_environment_file" "talos_image" {
  content_type = "iso"
  datastore_id = var.talos_image_datastore_id
  node_name = var.talos_image_datastore_nodename

  source_file {
    path = "https://github.com/siderolabs/talos/releases/download/${var.talos_version}/nocloud-amd64.raw.xz"
    file_name = local.talos_iso_file_name
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = var.virtual_environment_endpoint_ip
      user     = var.ssh_username
      agent    = true
    }

    inline = [
      "mv ${local.talos_image_path}/${local.talos_iso_file_name} ${local.talos_image_path}/${local.talos_xz_file_name}",
      "unxz -f ${local.talos_image_path}/${local.talos_xz_file_name}"
    ]
  }
}
