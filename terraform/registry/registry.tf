resource "yandex_container_registry" "devops-registry" {
  name = var.registry_name
  folder_id = var.folder_id
}

# resource "yandex_container_repository" "devops-repository" {
#   name = "${yandex_container_registry.devops-registry.id}/devops-repository"
# }

resource "yandex_container_registry_ip_permission" "permission" {
  registry_id = yandex_container_registry.devops-registry.id
  push        = [ "0.0.0.0/0" ]
  pull        = [ "0.0.0.0/0" ]
}