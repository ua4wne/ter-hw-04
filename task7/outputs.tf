output "access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  sensitive = true
}
output "secret_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  sensitive = true
}

output "bucket_name" {
  description = "The name of the bucket."
  value       = yandex_storage_bucket.state.bucket_domain_name   //module.s3.bucket_name
}
