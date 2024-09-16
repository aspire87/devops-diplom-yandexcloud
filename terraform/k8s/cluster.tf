resource "yandex_kubernetes_cluster" "k8s-regional" {
  network_id = local.network_output.network_id
  network_policy_provider = var.network_policy_provider
  service_account_id      = yandex_iam_service_account.sa-k8s.id
  node_service_account_id = yandex_iam_service_account.sa-k8s.id
  master {
    version = var.master_version
    public_ip = var.master_public_ip
    regional {
      region = var.master_region
      dynamic "location" {
        for_each = local.network_output.k8s_masters_subnet_info
        content {
          zone = location.value["zone"]
          subnet_id = location.value["subnet_id"]
        }
      }
    }
    security_group_ids = [local.network_output.sg_internal, local.network_output.sg_k8s_master]
  }
  depends_on = [
    yandex_resourcemanager_folder_iam_binding.k8s-clusters-agent,
    yandex_resourcemanager_folder_iam_binding.images-puller,
    yandex_resourcemanager_folder_iam_binding.k8s-admin
  ]
  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key-k8s.id
  }
}