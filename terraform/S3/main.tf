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
    bucket                      = "tf-au-net-dip"
    region                      = "ru-central1"
    key                         = "s3-terraform.tfstate"
    shared_credentials_file     = "storage.key"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  }
}

provider "yandex" {
  folder_id                = var.folder_id
  zone                     = var.default_zone
  cloud_id                 = var.cloud_id
  service_account_key_file = file("~/NETOLOGY/devops-diplom-yandexcloud/.authorized_key.json")
}