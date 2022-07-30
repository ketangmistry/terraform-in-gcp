output "network_self_link" {
  value       = module.networks.vpc_self_link
  description = "GCP Network Self Link"
}

output "network_name" {
  value       = module.networks.vpc_name
  description = "GCP Network Name"
}

output "subnet_self_link" {
  value       = module.networks.subnetwork_self_link
  description = "GCP Subnetwork Self Link"
}

output "subnet_name" {
  value       = module.networks.subnet_name
  description = "GCP Subnetwork Name"
}

output "run_status" {
  value       = module.run.run_status
  description = "GCP Cloud Run Status"
}

output "o11y_trace_receiver_sa_email" {
  value       = module.iam.o11y_trace_receiver_sa_email
  description = "Email for service account o11y-trace-receiver"
}

output "pubsub-topic-id" {
  value       = module.pubsub.pubsub-topic-id
  description = "The GCP Pub/Sub Lite Topic"
}

output "kms-name" {
  value       = module.kms.kms-name
  description = "The KMS key name"
}
