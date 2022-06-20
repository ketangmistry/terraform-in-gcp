provider "google" {
  credentials = var.credentials_gcp
  project = var.project_id
  region = var.region
  zone = var.zone
}

module "networks" {
  source = "./modules/networks"
  project_id = var.project_id
  region = var.region
  zone = var.zone
  prefix = var.prefix
}