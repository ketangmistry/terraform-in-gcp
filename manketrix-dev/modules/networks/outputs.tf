output "vpc_self_link" {
 value       = google_compute_network.vpc.self_link
 description = "GCP VPC Self Link"
}

output "vpc_name" {
    value = google_compute_network.vpc.name
    desdescription = "GCP VPC Name" 
}

output "subnet_self_link" {
 value       = google_compute_subnetwork.subnet.self_link
 description = "GCP Subnet Self Link"
}

output "subnet_name" {
 value = google_compute_subnetwork.subnet.name
 description = "GCP Subnet Name"
}