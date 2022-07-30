variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "zone" {
  type        = string
  description = "GCP Zone"
}

variable "prefix" {
  type        = string
  description = "Resource prefix"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "subnet_name" {
  type        = string
  description = "VPC Subnet Name"
}

variable "gke_node_count" {
  type        = string
  description = "GKE Node Count"
}