// Create SA 
resource "yandex_iam_service_account" "registry" {
  folder_id = var.folder_id
  name      = var.service_account_name
}

resource "yandex_resourcemanager_folder_iam_binding" "registry-pull" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  members   = ["serviceAccount:${yandex_iam_service_account.registry.id}"]
}

resource "yandex_resourcemanager_folder_iam_binding" "registry-push" {
  folder_id = var.folder_id
  role      = "container-registry.images.pusher"
  members   = ["serviceAccount:${yandex_iam_service_account.registry.id}"]
}

resource "yandex_container_registry_iam_binding" "registry-puller" {
  registry_id = yandex_container_registry.devops-registry.id
  role        = "container-registry.images.puller"
  #members     = ["serviceAccount:${yandex_iam_service_account.registry.id}"]
  members = [
    "system:allUsers",
  ]
}

resource "yandex_container_registry_iam_binding" "registry-pusher" {
  registry_id = yandex_container_registry.devops-registry.id
  role        = "container-registry.images.pusher"
  #members     = ["serviceAccount:${yandex_iam_service_account.registry.id}"]
  members = [
    "system:allUsers",
  ]
}

# // Create Static Access Keys
# resource "yandex_iam_service_account_static_access_key" "registry-static-key" {
#   service_account_id = yandex_iam_service_account.storage.id
#   description        = "static access key for object storage"
# }