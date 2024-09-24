data "yandex_compute_image" "vm-image" {
  family = var.image_family
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file("./key.pub")
  }
}

data "terraform_remote_state" "registry-terraform" {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-au-net-dip"
    region = "ru-central1"
    key = "registry-terraform.tfstate"
    shared_credentials_files = ["../../storage.key"]
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = false
  }
}

data "terraform_remote_state" "infra-terraform" {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-au-net-dip"
    region = "ru-central1"
    key = "infra-terraform.tfstate"
    shared_credentials_files = ["../../storage.key"]
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = false
  }
}