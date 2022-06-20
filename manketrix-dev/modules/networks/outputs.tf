output "vpc_self_link" {
 value       = google_compute_network.vpc.self_link
 description = "GCP VPC Self Link"
}

output "subnetwork_self_link" {
 value       = google_compute_subnetwork.subnet.self_link
 description = "GCP Subnetwork Self Link"
}