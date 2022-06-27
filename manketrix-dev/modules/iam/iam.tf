resource "google_service_account" "o11y-trace-receiver-sa" {
  account_id   = "o11y-trace-receiver-sa"
  display_name = "o11y-trace-receiver-sa"
}

resource "google_project_iam_member" "o11y-trace-receiver-iam-member" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:o11y-trace-receiver-sa@manketrix-dev.iam.gserviceaccount.com"
}