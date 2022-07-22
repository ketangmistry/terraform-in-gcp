provider "google" {
  credentials = var.credentials_gcp
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
}

module "networks" {
  source     = "./modules/networks"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
}

module "run" {
  source     = "./modules/run"
  project_id = var.project_id
  project_number = var.project_number
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
}

module "pubsub" {
  source     = "./modules/pubsub"
  project_id = var.project_id
  project_number = var.project_number
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
}

module "kms" {
  source     = "./modules/kms"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  prefix     = var.prefix
}