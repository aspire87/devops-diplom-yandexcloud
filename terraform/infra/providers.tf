provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file("~/NETOLOGY/devops-diplom-yandexcloud/.authorized_key.json")
}

// Create SA 
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "storage"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_binding" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.admin"
  members    = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_binding" "ydb-editor" {
  folder_id = var.folder_id
  role      = "ydb.admin"
  members    = ["serviceAccount:${yandex_iam_service_account.sa.id}"]
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

resource "yandex_storage_bucket" "test" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "tf-au-net-dip"
  max_size = 1073741824
  versioning {
    enabled = true
  }
  grant {
    id = yandex_iam_service_account.sa.id
    permissions = ["READ", "WRITE"]
    type        = "CanonicalUser"
  }
}

# data "yandex_iam_service_account" "sa" {
#   access_key = yandex_iam_service_account.sa.storage
# }

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

    backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-au-net-dip"
    region = "ru-central1"
    key    = "terraform.tfstate"
    
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}