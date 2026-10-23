resource "yandex_iam_service_account" "tf" {
  name = "diploma-tf-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.tf.id}"
}

resource "yandex_iam_service_account_static_access_key" "tf" {
  service_account_id = yandex_iam_service_account.tf.id
  description        = "key for terraform state"
}

resource "yandex_storage_bucket" "state" {
  bucket     = var.bucket_name
  folder_id  = var.folder_id


  depends_on = [yandex_resourcemanager_folder_iam_member.editor]
}
