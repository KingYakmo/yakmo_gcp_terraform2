resource "google_compute_firewall" "allow-icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-vpc-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = ["24.162.108.137/32"]

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "3389"]
  }
}


