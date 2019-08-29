variable project {
  description = "ID project"
}

variable region {
  description = "Region"

  # Значение по умолчанию
  default = "europe-west1"
}

variable zone {
  description = "Zone"

  # Значение по умолчанию
  default = "europe-west1-b"
}

variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
}

variable disk_image {
  description = "Disk image"
}

variable private_key_path {
  description = "~/.ssh/appuser"
}
