output "run_status" {
 value       = google_cloud_run_service.o11y-trace-receiver.status
 description = "GCP Cloud Run Status"
}
