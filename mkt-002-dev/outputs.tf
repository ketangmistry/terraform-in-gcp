output "storage_self_link" {
 value       = module.storage.storage_self_link
 description = "GCP Storage Self Link"
}

output "network_self_link" {
 value       = module.networks.vpc_self_link
 description = "GCP Network Self Link"
}

output "subnetwork_self_link" {
 value       = module.networks.subnetwork_self_link
 description = "GCP Subnetwork Self Link"
}