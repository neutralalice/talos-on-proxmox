data "talos_machine_configuration" "node" {
  cluster_name     = var.kubernetes_cluster_name
  cluster_endpoint = "https://${var.talos_virtual_ip}:6443"

  machine_type    = var.talos_machine_type
  machine_secrets = var.talos_cluster_secrets.machine_secrets

  talos_version      = var.talos_version
  kubernetes_version = var.kubernetes_version
}

resource "talos_machine_configuration_apply" "node" {
  node = var.node_ip
  endpoint = var.talos_virtual_ip

  client_configuration        = var.talos_cluster_secrets.client_configuration
  machine_configuration_input = data.talos_machine_configuration.node.machine_configuration

  config_patches = var.talos_patches
}
