provider "proxmox" {
  endpoint = "https://${var.virtual_environment_endpoint_ip}:${var.virtual_environment_endpoint_port}"
  api_token = var.virtual_environment_api_token
  insecure = true

  ssh {
    agent = true
    username = var.ssh_username
  }
}

provider "talos" {}

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.1"
    }
    talos = {
      source = "siderolabs/talos"
      version = "0.6.0"
    }
  }
  required_version = ">= 1.8.2"
}

