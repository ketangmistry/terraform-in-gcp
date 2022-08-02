output "vpc_self_link" {
  value       = google_storage_bucket.store2-mkt-002.self_link
  description = "Bucket Self Link"
}