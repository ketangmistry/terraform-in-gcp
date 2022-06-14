resource "google_compute_network" "mkt-002-vpc" {
  name                    = "mkt-002-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "mkt-002-subnet" {
  name          = "mkt-002-subnet"
  region        = var.region
  network       = google_compute_network.mkt-002-vpc.name
  ip_cidr_range = "10.132.0.0/20"
}
