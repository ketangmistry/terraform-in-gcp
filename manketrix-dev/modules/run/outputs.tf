output "run_status" {
 value       = google_cloud_run_service.o11y_trace_receiver.status
 description = "GCP Cloud Run Status"
}
