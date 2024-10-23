provider "proxmox" {
  endpoint = "https://${var.pve_endpoint_ip}:${var.pve_endpoint_port}"
  api_token = var.pve_api_token
  insecure = true

  ssh {
    agent = true
    username = var.pve_ssh_username
  }
}

provider "talos" {}

terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66.2"
    }
    talos = {
      source = "siderolabs/talos"
      version = "0.7.0-alpha.0"
    }
  }
  required_version = ">= 1.8.2"
}

