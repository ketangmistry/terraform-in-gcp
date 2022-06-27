data "google_secret_manager_secret" "nr-ingest-license-key" {
  secret_id = "nr-ingest-license-key"
}

resource "google_cloud_run_service" "o11y-trace-receiver" {
  name     = "o11y-trace-receiver"
  location = var.region

  template {
    spec {
      containers {
        image = "europe-west1-docker.pkg.dev/manketrix-dev/containers/o11y_trace_receiver"
        env {
          name = "NR_INGEST_LICENSE_KEY"
          value_from {
            secret_key_ref {
              name = data.google_secret_manager_secret.nr-ingest-license-key.secret_id
              key = "latest"
            }
          }
        }
        ports {
          container_port = 8090
        }
      }
      service_account_name = "o11y-trace-receiver-sa@${var.project_id}.iam.gserviceaccount.com"
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  
}

