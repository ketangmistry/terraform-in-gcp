output "vpc_self_link" {
  value       = google_compute_instance.instance-1.self_link
  description = "VM Self Link"
}