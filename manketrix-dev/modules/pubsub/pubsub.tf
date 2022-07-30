resource "google_pubsub_lite_reservation" "pubsub-reservation" {
  name                = "${var.prefix}-reservation"
  project             = var.project_number
  throughput_capacity = 1
}

resource "google_pubsub_lite_topic" "pubsub-topic" {
  name    = "${var.prefix}-topic"
  project = var.project_number

  partition_config {
    count = 1
    capacity {
      publish_mib_per_sec   = 4
      subscribe_mib_per_sec = 8
    }
  }

  retention_config {
    per_partition_bytes = 32212254720
  }

  reservation_config {
    throughput_reservation = google_pubsub_lite_reservation.pubsub-reservation.name
  }
}

resource "google_pubsub_lite_subscription" "pubsub-subscription" {
  name  = "${var.prefix}-subscription"
  topic = google_pubsub_lite_topic.pubsub-topic.name

  delivery_config {
    delivery_requirement = "DELIVER_AFTER_STORED"
  }
}