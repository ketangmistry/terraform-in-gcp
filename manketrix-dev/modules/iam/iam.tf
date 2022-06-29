resource "google_service_account" "o11y-trace-receiver-sa" {
  account_id   = "o11y-trace-receiver-sa"
  display_name = "o11y-trace-receiver-sa"
}

resource "google_project_iam_member" "o11y-trace-receiver-iam-secrets" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:o11y-trace-receiver-sa@manketrix-dev.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "o11y-trace-receiver-iam-pubsub" {
  project = var.project_id
  role    = "roles/pubsublite.publisher"
  member  = "serviceAccount:o11y-trace-receiver-sa@manketrix-dev.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "o11y-trace-receiver-iam-artifacts" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:o11y-trace-receiver-sa@manketrix-dev.iam.gserviceaccount.com"
}