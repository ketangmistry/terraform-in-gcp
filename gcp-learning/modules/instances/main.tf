resource "google_compute_instance" "instance-1" {
  name = "instance-1"

  # Task 4: Modify and update infrastructure
  # machine_type = "e2-micro"
  machine_type = "n1-standard-2"


  zone = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20220519"
    }
  }

  network_interface {
    network    = "${var.project_id}-vpc"
    subnetwork = "${var.project_id}-subnet"
  }

  metadata_startup_script = <<-EOT
      #!/bin/bash
      echo "Hello"
    EOT

  allow_stopping_for_update = true

}

# Task 4: Modify and update infrastructure
resource "google_compute_instance" "instance-2" {
  name = "instance-2"


  machine_type = "n1-standard-2"

  # Task 6: Use a module from a registry
  # zone         = "europe-west1-b"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20220519"
    }
  }

  # Task 6: Use a module from a registry
  # network_interface {
  #   network = "gcp-learn-vpc"
  #   subnetwork = "gcp-learn-vpc"
  # }

  network_interface {
    network    = "gcp-learning-terraform-public-module"
    subnetwork = "subnet-01"
  }

  metadata_startup_script = <<-EOT
      #!/bin/bash
      echo "Hello Again!"
    EOT

  allow_stopping_for_update = true

}

