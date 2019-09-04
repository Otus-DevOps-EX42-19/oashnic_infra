variable "project" {
  description = "ID project"
}

variable "region" {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west1"
}

variable "zone" {
  description = "Zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}

variable "public_key_path" {
  # Описание переменной
  description = "public key appuser"
}

variable "public_key_path_2" {
  # Описание переменной
  description = "public key appuser1"
}

variable "disk_image" {
  description = "Disk image"
}

variable "private_key_path" {
  description = "~/.ssh/appuser"
}

variable "count_node" {
  description = "Count node reddit"
  default = "1"
}

variable "app_disk_image" {
  description = "App disk image"
  default = "reddit-app-base"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
