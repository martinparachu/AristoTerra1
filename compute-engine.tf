resource "google_compute_instance" "vm_instance" {
  name         = "milan-linux-instance"
  machine_type = var.vm_machine_type
  zone         = var.vm_zone 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = file("./scripts/install-unity.sh")

  network_interface {
    # A default network is created for all GCP projects
    network       = google_compute_network.milan_vpc_network.self_link
    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_network" "milan_vpc_network" {
  name                    = "milan-build-node-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "instance-SG" {
  name    = "build-node-sg"
  network = google_compute_network.milan_vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  
}