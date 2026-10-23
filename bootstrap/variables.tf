variable "zone" {
  type    = string
  default = "ru-central1-d"
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "token" {
  type      = string
  sensitive = true
}

variable "bucket_name" {
  type    = string
  default = "victoria-diploma-tfstate"
}
