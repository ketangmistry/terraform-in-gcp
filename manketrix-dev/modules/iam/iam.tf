resource "google_service_account" "o11y-trace-receiver-sa" {
  account_id   = "o11y-trace-receiver-sa"
  display_name = "o11y-trace-receiver-sa"
}

resource "google_project_iam_binding" "o11y-trace-receiver-iam-binding" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:o11y-trace-receiver@manketrix-dev.iam.gserviceaccount.com"
  ]
}