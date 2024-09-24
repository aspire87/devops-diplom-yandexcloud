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
    shared_credentials_files    = ["../../storage.key"]
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true 
    skip_s3_checksum            = true 
  }
}

provider "yandex" {
  folder_id                = var.folder_id
  zone                     = var.default_zone
  cloud_id                 = var.cloud_id
  service_account_key_file = file("../../keys.json")
}