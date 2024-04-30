terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "bigmos-project-2024-419920"
  region = "asia-southeast1"
  zone = "asia-southeast1-a"
  credentials = "bigmos-project-2024-419920-79eb77330b9c.json"

}

resource "google_storage_bucket" "yakmosbucket" {
  name          = "if_you_got_this_then_it_worked"
  location      = "us-central1"
  force_destroy = true

}

resource "google_compute_network" "auto-vpc-tf" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-vpc-tf" {
  name = "custom-vpc-tf"
  auto_create_subnetworks = false  
}

resource "google_compute_subnetwork" "sub-sing" {
  name = "sub-sing"
  network = google_compute_network.custom-vpc-tf.id
  ip_cidr_range = "192.168.1.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true
}


output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}  