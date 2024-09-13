# // Create SA 
# resource "yandex_iam_service_account" "sa" {
#   folder_id = var.folder_id
#   name      = "storage"
# }

# // Grant permissions
# resource "yandex_resourcemanager_folder_iam_binding" "sa-editor" {
#   folder_id = var.folder_id
#   role      = "storage.admin"
#   members    = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
# }

# // Grant permissions
# resource "yandex_resourcemanager_folder_iam_binding" "ydb-editor" {
#   folder_id = var.folder_id
#   role      = "ydb.admin"
#   members    = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
# }

# // Create Static Access Keys
# resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#   service_account_id = yandex_iam_service_account.sa.id
#   description        = "static access key for object storage"
# }

# # // Grant permissions
# # resource "yandex_resourcemanager_folder_iam_binding" "storage-admin" {
# #   folder_id = var.folder_id
# #   role            = "storage.editor"
# #   members         = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
# # }

# # // Grant permissions
# # resource "yandex_resourcemanager_folder_iam_binding" "ydb-admin" {
# #   folder_id = var.folder_id
# #   role            = "ydb.editor"
# #   members         = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
# # }

// Use keys to create bucket
resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.storage-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.storage-static-key.secret_key
  bucket     = var.s3_bucket_name
  max_size   = 1073741824
  versioning {
    enabled = true
  }
  grant {
    id          = yandex_iam_service_account.storage.id
    permissions = ["READ", "WRITE"]
    type        = "CanonicalUser"
  }
}
