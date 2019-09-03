variable "zone" {
  description = "Zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}

variable "public_key_path" {
  description = "public key appuser"
}
