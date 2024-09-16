// Create SA 
resource "yandex_iam_service_account" "registry" {
  folder_id = var.folder_id
  name      = var.service_account_name
}

// Grant permissions
resource "yandex_container_registry_iam_binding" "registry-admin" {
  registry_id = yandex_container_registry.devops-registry.id
  role      = "container-registry.admin"
  members   = ["serviceAccount:${yandex_iam_service_account.registry.id}"]
}

# resource "yandex_container_repository_iam_binding" "repository-admin" {
#   repository_id = yandex_container_repository.devops-repository.id
#   role = "container-registry.admin"
#   members = [ "serviceAccount:${yandex_iam_service_account.registry.id}" ]
# }

# // Create Static Access Keys
# resource "yandex_iam_service_account_static_access_key" "registry-static-key" {
#   service_account_id = yandex_iam_service_account.storage.id
#   description        = "static access key for object storage"
# }