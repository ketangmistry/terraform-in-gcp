# Task 1: Create the configuration files
provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

# No task, just my own testing
module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

# Task 2: Import infrastructure
module "instances" {
  source = "./modules/instances"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

# Task 3: Configure remote backend
module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

# Task 6: Use a module from a registry
module "network_from_public" {
  source  = "terraform-google-modules/network/google"
  version = "3.4.0"
  project_id = var.project_id
  network_name = "gcp-learning-terraform-public-module"
  subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-central1"
        }

  ]
}

# Task 7: Configure a firewall
resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "gcp-learning-terraform-public-module"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}