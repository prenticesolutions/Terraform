variable "gcp_cred" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}

provider "google" {
    project = ""
    credentials = var.gcp_cred
    region="us-central1"
    zone="us-central1-c"
}

resource "google_compute_instance" "test-server" {
  name         = "test-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20220901"
    }
  }

resource "google_compute_disk" "basic-vol"{
  name = "basic-vol"
  size = 10
  zone = "us-central1-c"
}

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "test-server"
  auto_create_subnetworks = "true"
}
