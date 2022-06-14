provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

// 1. Create an instance template
resource "google_compute_instance_template" "instance-template-1" {
  name = "instance-template-1"
  machine_type = "f1-micro"

  disk {
    source_image      = "debian-cloud/debian-9"
    boot              = true
  }

  network_interface {
    network = "mkt-002-vpc"
    subnetwork = "mkt-002-subnet"

    access_config {
      // Ephemeral public IP
    }
  }


  metadata_startup_script = file("${path.module}/scripts/startup.sh")

}

// 2. Create a target pool.
resource "google_compute_target_pool" "target-pool-1" {
  name = "target-pool-1"
  health_checks = [google_compute_http_health_check.health-check-1.id]
}

// 3. Create managed instance group
resource "google_compute_instance_group_manager" "managed-instance-group-1" {
  name = "managed-instance-group-1"

  base_instance_name = "nucleus"
  zone               = var.zone

  version {
    instance_template  = google_compute_instance_template.instance-template-1.id
  }

  target_pools = [google_compute_target_pool.target-pool-1.id]
  target_size  = 2

  named_port {
    name = "http"
    port = 80
  }

}

// 4. Create a firewall rule named to allow traffic (80/tcp).
resource "google_compute_firewall" "tf-firewall" {
  name    = "firewall-rule-1"
  network = "projects/mkt-002/global/networks/mkt-002-vpc"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}

// 5. Create a health check
resource "google_compute_http_health_check" "health-check-1" {
  name         = "health-check-1"
}

// 6. Create a backend service, and attach the managed instance group with named port (http:80)
resource "google_compute_backend_service" "backend-service-1" {
  name          = "backend-service-1"
  health_checks = [google_compute_http_health_check.health-check-1.id]

  backend {
    group = google_compute_instance_group_manager.managed-instance-group-1.instance_group
  }

}

// 7a. Create a URL map, and target the HTTP proxy to route requests to your URL map.
resource "google_compute_url_map" "url-map-1" {
  name            = "url-map-1"
  default_service = google_compute_backend_service.backend-service-1.id
}

// 7b. Create a URL map, and target the HTTP proxy to route requests to your URL map.
resource "google_compute_target_http_proxy" "target-http-proxy-1" {
  name     = "target-http-proxy-1"
  url_map  = google_compute_url_map.url-map-1.id
}

// 8. Create a forwarding rule.
resource "google_compute_global_forwarding_rule" "forwarding-rule-1" {
  name                  = "forwarding-rule-1"
  target = google_compute_target_http_proxy.target-http-proxy-1.id
  port_range = "80"
}


# # Task 2: Import infrastructure
# module "instances" {
#   source = "./modules/instances"
#   project_id = var.project_id
#   region = var.region
#   zone = var.zone
# }

# # Task 3: Configure remote backend
# module "storage" {
#   source = "./modules/storage"
#   project_id = var.project_id
#   region = var.region
#   zone = var.zone
# }

# # Task 6: Use a module from a registry
# module "network_from_public" {
#   source  = "terraform-google-modules/network/google"
#   version = "3.4.0"
#   project_id = var.project_id
#   network_name = "gcp-learning-terraform-public-module"
#   subnets = [
#         {
#             subnet_name           = "subnet-01"
#             subnet_ip             = "10.10.10.0/24"
#             subnet_region         = "us-central1"
#         },
#         {
#             subnet_name           = "subnet-02"
#             subnet_ip             = "10.10.20.0/24"
#             subnet_region         = "us-central1"
#         }

#   ]
# }

# # Task 7: Configure a firewall
# resource "google_compute_firewall" "tf-firewall" {
#   name    = "tf-firewall"
#   network = "gcp-learning-terraform-public-module"

#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = ["0.0.0.0/0"]
# }