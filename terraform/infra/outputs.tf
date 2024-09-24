output "worker-1-local-address" {
  value = yandex_compute_instance.kube-node.1.network_interface.0.ip_address
}

output "worker-2-local-address" {
  value = yandex_compute_instance.kube-node.2.network_interface.0.ip_address
}