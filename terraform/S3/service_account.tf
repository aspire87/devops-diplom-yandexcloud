// Create SA 
resource "yandex_iam_service_account" "storage" {
  folder_id = var.folder_id
  name      = var.service_account_name
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_binding" "storage-editor" {
  folder_id = var.folder_id
  role      = "storage.admin"
  members   = ["serviceAccount:${yandex_iam_service_account.storage.id}"]
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "storage-static-key" {
  service_account_id = yandex_iam_service_account.storage.id
  description        = "static access key for object storage"
}