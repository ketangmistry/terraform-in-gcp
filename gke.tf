variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

# Assign New Relic Service Account to GCP Project for Monitoring

# Problem 1:
# Error: Request "Create IAM Members roles/monitoring.viewer serviceAccount:td3jdn50y3p@newrelic-gcp.iam.gserviceaccount.com 
# for \"project \\\"mkt-002\\\"\"" returned error: Error retrieving IAM policy for project "mkt-002": googleapi: 
# Error 403: Cloud Resource Manager API has not been used in project 105397217286 before or it is disabled. 
# Enable it by visiting https://console.developers.google.com/apis/api/cloudresourcemanager.googleapis.com/overview?project=105397217286 then retry. 
# If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry., accessNotConfigured

# Solution to problem 1 was to activate the Cloud Resource Manager API

# Problem 2:
# Error: Request "Create IAM Members roles/monitoring.viewer serviceAccount:td3jdn50y3p@newrelic-gcp.iam.gserviceaccount.com for \"project \\\"mkt-002\\\"\"" returned error: 
# Error applying IAM policy for project "mkt-002": Error setting IAM policy for project "mkt-002": googleapi: Error 403: Policy update access denied., forbidden


#resource "google_project_iam_member" "project" {
#  project = "mkt-002"
#  role    = "roles/monitoring.viewer"
#  member  = "serviceAccount:td3jdn50y3p@newrelic-gcp.iam.gserviceaccount.com"
#}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/cloud_debugger"
    ]

   labels = {
      env = var.project_id
    }

    preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}


# # Kubernetes provider
# # The Terraform Kubernetes Provider configuration below is used as a learning reference only. 
# # It references the variables and resources provisioned in this file. 
# # We recommend you put this in another file -- so you can have a more modular configuration.
# # https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster#optional-configure-terraform-kubernetes-provider
# # To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider.

# provider "kubernetes" {
#   load_config_file = "false"

#   host     = google_container_cluster.primary.endpoint
#   username = var.gke_username
#   password = var.gke_password

#   client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
#   client_key             = google_container_cluster.primary.master_auth.0.client_key
#   cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
# }

