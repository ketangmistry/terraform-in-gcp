resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "e2-micro"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20220519"
    }
  }

  network_interface {
    network = "${var.project_id}-vpc"
    subnetwork = "${var.project_id}-subnet"
  }

  metadata_startup_script = <<-EOT
      #!/bin/bash
      echo "Hello"
    EOT

  allow_stopping_for_update = true

}

