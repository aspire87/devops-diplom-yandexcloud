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


data "template_file" "storage-key-template" {
  template = file("key.tf.tpl")
  vars = {
    access_key = yandex_iam_service_account_static_access_key.storage-static-key.access_key
    secret_key = nonsensitive(yandex_iam_service_account_static_access_key.storage-static-key.secret_key)
  }
}

resource "local_file" "key_s3_storage_key_file" {
  filename = "../../storage.key"
  content  = data.template_file.storage-key-template.rendered
}