output "storage_self_link" {
 value       = google_storage_bucket.mkt-002-terraform.self_link
 description = "GCP Storage Self Link"
}