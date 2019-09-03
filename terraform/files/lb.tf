terraform {
  required_version = "0.12.6"
}

resource "google_compute_target_pool" "reddits" {
  name = "reddits-pool"

  instances = "${google_compute_instance.app[*].self_link}"

  health_checks = [
    "${google_compute_http_health_check.default.self_link}"
  ]
}

resource "google_compute_forwarding_rule" "default" {
  name = "redditlb"
  region = "europe-west1"

  load_balancing_scheme = "EXTERNAL"

  target = "${google_compute_target_pool.reddits.self_link}"
}

resource "google_compute_http_health_check" "default" {
  name = "check-http-reddit"
  request_path = "/"
  check_interval_sec = 1
  timeout_sec = 1
  port = "9292"
}
