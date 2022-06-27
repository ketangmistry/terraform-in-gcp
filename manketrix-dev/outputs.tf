output "network_self_link" {
  value       = module.networks.vpc_self_link
  description = "GCP Network Self Link"
}

output "subnetwork_self_link" {
  value       = module.networks.subnetwork_self_link
  description = "GCP Subnetwork Self Link"
}

output "run_status" {
  value       = module.run.run_status
  description = "GCP Cloud Run Status"
}

output "o11y_trace_receiver_sa_email" {
  value = module.iam.o11y_trace_receiver_sa_email
  description = "Email for service account o11y-trace-receiver"
}
