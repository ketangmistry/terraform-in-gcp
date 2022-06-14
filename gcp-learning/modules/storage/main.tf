resource "google_storage_bucket" "store2-mkt-002" {
  name          = "store2-mkt-002"

  location      = "EU"

  force_destroy = true

  uniform_bucket_level_access = true
}

