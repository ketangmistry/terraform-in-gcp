resource "google_cloud_run_service" "o11y_trace_receiver" {
  name     = "o11y_trace_receiver"
  location = var.region

  template {
    spec {
      containers {
        image = "europe-west1-docker.pkg.dev/manketrix-dev/containers/o11y_trace_receiver"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
