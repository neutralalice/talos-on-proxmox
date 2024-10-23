output "image_factory_schematic_id" {
  description = "talos image factory schematic id"
  value = talos_image_factory_schematic.this.id
}

output "talos_image_file_name" {
  description = "name of talos image id"
  value = proxmox_virtual_environment_download_file.talos_image.id
}
