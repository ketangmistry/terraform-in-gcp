resource "google_storage_bucket" "mkt-002-terraform" {
  name          = "mkt-002-terraform"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true

  lifecycle {
    prevent_destroy = true
  }

}

