variable "zone" {
  description = "Zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}

variable "app_disk_image" {
  description = "App disk image"
  default = "reddit-app-base"
}

variable "public_key_path" {
  description = "public key appuser"
}

variable "private_key_path" {
  description = "private key appuser"
}

variable "db_url" {
  description = "mongodb url"
}
