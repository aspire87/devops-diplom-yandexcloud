resource "yandex_container_registry" "devops-registry" {
  name      = var.registry_name
  folder_id = var.folder_id
}
