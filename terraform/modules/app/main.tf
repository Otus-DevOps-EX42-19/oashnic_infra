resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["reddit-app"]
  boot_disk {
    initialize_params { image = var.app_disk_image }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.app_ip.address
    }
  }
  metadata = {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
   host  = self.network_interface[0].access_config[0].nat_ip
   type  = "ssh"
   user  = "appuser"
   agent = false

   # путь до приватного ключа
   private_key = file(var.private_key_path)
  }

   # Деплой приложения

   # systemd
   provisioner "file" {
    source      = "${path.module}/files/puma.service"
    destination = "/tmp/puma.service"
   }

   provisioner "file" {
     source = "${path.module}/files/deploy.sh"
     destination = "/tmp/deploy.sh"
   }

   # скрипт деплоя
   provisioner "remote-exec" {
     inline = [ "echo 'export DATABASE_URL=${var.db_url}' > /home/appuser/.bash_profile",
    "chown appuser:appuser /home/appuser/.bash_profile",
    "chmod +x /tmp/deploy.sh",
    "/tmp/deploy.sh"]
   }
 }

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
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
