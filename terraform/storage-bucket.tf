provider "google" {
  version = "2.5.0"
  project = var.project
  region = var.region
}

module "storage-bucket" {
  source = "SweetOps/storage-bucket/google"
  version = "0.3.0"
  name = "storage-bucket-oashnic"
  location = var.region
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
