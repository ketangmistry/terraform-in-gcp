output "run_self_link" {
 value       = google_cloud_run_service.o11y_trace_receiver.run_self_link
 description = "GCP Cloud Run Self Link"
}
