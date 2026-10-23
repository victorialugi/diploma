output "bucket_name" {
  value = yandex_storage_bucket.state.bucket
}

output "access_key" {
  value     = yandex_iam_service_account_static_access_key.tf.access_key
  sensitive = true
}

output "secret_key" {
  value     = yandex_iam_service_account_static_access_key.tf.secret_key
  sensitive = true
}

output "sa_id" {
  value = yandex_iam_service_account.tf.id
}
