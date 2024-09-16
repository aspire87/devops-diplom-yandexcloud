resource "yandex_iam_service_account" "sa-k8s" {
  name        = var.service_account_name
  description = "K8S regional service account"
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s-clusters-agent" {
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-k8s.id}"
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "k8s-admin" {              
  folder_id = var.folder_id
  role      = "k8s.admin"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-k8s.id}"
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "vpc-public-admin" {
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-k8s.id}"
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "images-puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-k8s.id}"
  ]
}

resource "yandex_kms_symmetric_key" "kms-key-k8s" {
  name              = var.kms_provider_key_name
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}

resource "yandex_kms_symmetric_key_iam_binding" "viewer" {
  symmetric_key_id = yandex_kms_symmetric_key.kms-key-k8s.id
  role             = "viewer"
  members = [
    "serviceAccount:${yandex_iam_service_account.sa-k8s.id}",
  ]
}