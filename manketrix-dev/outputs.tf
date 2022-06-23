output "network_self_link" {
  value       = module.networks.vpc_self_link
  description = "GCP Network Self Link"
}

output "subnetwork_self_link" {
  value       = module.networks.subnetwork_self_link
  description = "GCP Subnetwork Self Link"
}

output "run_self_link" {
  value       = module.run_self_link
  description = "GCP Cloud Run Self Link"
}