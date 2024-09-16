data "terraform_remote_state" "network-terraform" {
  backend = "s3"
  config = {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-au-net-dip"
    region = "ru-central1"
    key = "network-terraform.tfstate"
    shared_credentials_files = ["../../storage.key"]
    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = false
  }
}