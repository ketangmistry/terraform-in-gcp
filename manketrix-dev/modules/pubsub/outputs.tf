output "pubsub-topic-id" {
  value       = google_pubsub_lite_topic.pubsub-topic.id
  description = "The GCP Pub/Sub Lite Topic"
}
