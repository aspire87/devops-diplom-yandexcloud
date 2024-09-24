output "registry_id" {
  value = yandex_container_registry.devops-registry.id
}

output "sa_id" {
  value = yandex_iam_service_account.registry.id
}