resource "google_service_account" "o11y-trace-receiver-sa" {
  account_id   = "o11y-trace-receiver-sa"
  display_name = "o11y-trace-receiver-sa"
}


data "google_project_iam_policy" "o11y-trace-receiver-policy-binding" {
  binding {
    role = "roles/secretmanager.secretAccessor"

    members = [
      "serviceAccount:o11y-trace-receiver@manketrix-dev.iam.gserviceaccount.com"
    ]
  }
}