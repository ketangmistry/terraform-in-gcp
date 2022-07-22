resource "google_kms_key_ring" "keyring" {
  name     = "${var.prefix}-keyring"
  location = "global"
}

resource "google_kms_crypto_key" "asymmetric-decrypt-key" {
  name     = "${var.prefix}-crypto-key"
  key_ring = google_kms_key_ring.keyring.id
  purpose  = "ASYMMETRIC_DECRYPT"
  rotation_period = 259200

  lifecycle {
    prevent_destroy = true
  }

}