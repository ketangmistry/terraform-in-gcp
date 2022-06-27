resource "google_cloud_run_service" "o11y-trace-receiver" {
  name     = "o11y-trace-receiver"
  location = var.region

  template {
    spec {
      containers {
        image = "europe-west1-docker.pkg.dev/manketrix-dev/containers/o11y_trace_receiver"
        ports {
          container_port = 8090
        }
      }
      service_account_name = "o11y-trace-receiver-sa@manketrix-dev.iam.gserviceaccount.com"
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  
}

