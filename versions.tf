terraform {

  # 3. Configure remote backend
  backend "gcs" {
    bucket  = "store2-mkt-002"
    prefix  = "terraform/state"
  }

  required_version = "~> 1.2.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.90.1"
    }
  }

}

