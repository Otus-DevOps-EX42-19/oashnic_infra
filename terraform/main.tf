terraform {
  # Версия terraform
  required_version = "0.12.6"
}

provider "google" {
  # Версия провайдера
  version = "2.5.1"

  # ID проекта
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "app" {
  name         = "reddit-app-${count.index}"
  count        = var.count_node
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["reddit-app"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "reddit-base-1567079488"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {
    }
  }

  metadata = {
    # путь до публичного ключа
    ssh-keys = "appuser:${file(var.public_key_path)} appuser1:${file(var.public_key_path_2)}"
  }

  connection {
    host  = self.network_interface[0].access_config[0].nat_ip
    type  = "ssh"
    user  = "appuser"
    agent = false

    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  # Провижины
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}
