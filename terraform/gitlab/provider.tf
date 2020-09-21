provider "google" {
  credentials = file("tf.json")
  project     = var.project
  region      = var.region
  zone        = var.zone
}