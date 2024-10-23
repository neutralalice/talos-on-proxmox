locals {
  talos_image_file_name = "talos-${var.talos_version}-${var.talos_platform}-${var.talos_architecture}.iso"
}

data "talos_image_factory_extensions_versions" "this" {
  talos_version = var.talos_version
  filters = {
    names = var.talos_extensions
  }
}

resource "talos_image_factory_schematic" "this" {
  schematic = yamlencode(
    {
      customization = {
        systemExtensions = {
          officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info[*].name
        }
      }
    }
  )
}

data "talos_image_factory_urls" "this" {
  talos_version = var.talos_version
  architecture = var.talos_architecture
  schematic_id = talos_image_factory_schematic.this.id
  platform = var.talos_platform
}

resource "proxmox_virtual_environment_download_file" "talos_image" {
  content_type = "iso"
  datastore_id = var.talos_image_datastore_id
  node_name = var.talos_image_datastore_nodename
  overwrite = true
  url = data.talos_image_factory_urls.this.urls.iso
  file_name = local.talos_image_file_name
}
