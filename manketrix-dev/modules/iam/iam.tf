resource "google_service_account" "o11y-trace-receiver" {
  account_id   = "o11y-trace-receiver"
  display_name = "o11y-trace-receiver"
}

