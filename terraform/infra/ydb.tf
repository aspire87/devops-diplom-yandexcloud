resource "yandex_ydb_database_serverless" "db_lock_tf" {
  name                = "state-lock-tf-db"
  deletion_protection = "false"

  serverless_database {
    enable_throttling_rcu_limit = true
    provisioned_rcu_limit       = 0
    storage_size_limit          = 1
    throttling_rcu_limit        = 10
  }
}

data "yandex_ydb_database_serverless" "db_lock_tf" {
    name = yandex_ydb_database_serverless.db_lock_tf.name
}