module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

module "instances" {
  source = "./modules/instances"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}


provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}