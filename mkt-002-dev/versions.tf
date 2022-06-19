terraform {

  backend "gcs" {
    bucket  = "mkt-002-terraform"
    prefix  = "terraform/state"
  }

  required_version = "~> 1.2.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.24.0"
    }
  }

}

