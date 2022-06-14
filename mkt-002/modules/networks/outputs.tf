output "vpc_self_link" {
 value       = google_compute_network.mkt-002-vpc.self_link
 description = "GCP VPC Self Link"
}

output "subnetwork_self_link" {
 value       = google_compute_subnetwork.mkt-002-subnet.self_link
 description = "GCP Subnetwork Self Link"
}