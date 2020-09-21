#Network Interface Creation#
resource "google_compute_address" "vm_static_ip" {
  name = "gitlab-static-ip"
}

#Firewall Creation

resource "google_compute_firewall" "gcp-fw" {
  name    = "automation-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  target_tags = ["automation-infra","default-node-pool"]
  source_ranges = ["0.0.0.0/0"]
}

# Instance creation 

resource "google_compute_instance" "test-gcp" {
  name         = "gitlab-ci"
  machine_type = "e2-medium"
  zone         = var.zone
  can_ip_forward       = true
  tags = ["automation-infra"]
  

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-xenial-v20200908"
      size = 100
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }


# We connect to our instance via Terraform and remotely executes our script using SSH
  provisioner "remote-exec" {
    script = var.script_path

    connection {
      type        = "ssh"
      host        = google_compute_address.vm_static_ip.address
      user        = var.username
      private_key = file(var.private_key_path)
    }
  }
}


output "out_gitlab_pub_ip" {
    value = google_compute_address.vm_static_ip.address
}
