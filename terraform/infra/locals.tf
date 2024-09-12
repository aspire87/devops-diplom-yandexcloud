locals {
  bucket = yandex_storage_bucket.test.bucket
  backend_endpoint = yandex_ydb_database_serverless.db_lock_tf.document_api_endpoint
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secter_key = nonsensitive(yandex_iam_service_account_static_access_key.sa-static-key.secret_key)
} 


