variable "credentials_gcp" {
  type        = string
  description = "GCP Service Account for Terraform"
}

variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "prefix" {}
variable "location" {}
variable "project_number" {}
variable "gke_username" {}
variable "gke_password" {}

variable "vpc_name" {
  type    = string
  default = "empty-vpc-name"
}

variable "subnet_name" {
  type    = string
  default = "empty-subnet-name"
}

variable "gke_node_count" {
  type        = number
  default     = 3
  description = "Default number of GKE nodes in pool"
}
