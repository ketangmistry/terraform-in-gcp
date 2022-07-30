output "kms-name" {
  value       = google_kms_crypto_key.asymmetric-decrypt-key.name
  description = "KMS key name"
}


