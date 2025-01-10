resource "yandex_iam_service_account" "sa" {
  name        = var.sa_name
  description = "for terraform task"
  folder_id   = var.folder_id
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  depends_on = [yandex_iam_service_account.sa]
  folder_id  = var.folder_id
  role       = "storage.editor"
  member     = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for object storage"
}

resource "yandex_storage_bucket" "state" {
  bucket     = "tf-bucket-${random_string.unique_id.result}"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  max_size   = 1073741824 // 1Gb
}

#To always have a unique bucket name in this example
resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "yandex_ydb_database_serverless" "db_tfstate" {
  name                = "test-ydb-serverless"
  deletion_protection = false

  serverless_database {
    enable_throttling_rcu_limit = false
    provisioned_rcu_limit       = 10
    storage_size_limit          = 1
    throttling_rcu_limit        = 0
  }
}
