provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "storage" {
  source = "./modules/storage"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}

module "networks" {
  source = "./modules/networks"
  project_id = var.project_id
  region = var.region
  zone = var.zone
}