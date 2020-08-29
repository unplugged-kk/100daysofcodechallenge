#GCP Auth Setup

provider "google" {
  credentials = file("gcp-la-terraform.json")
  project     = "playground-s-11-b1aec1"
  region      = "us-west1"
}

#Creation of VPC NW 

resource "google_compute_network" "vpc_network" {
  name = "kubernetes-the-hard-way"
  auto_create_subnetworks = "false"
}

#Creation of subnet 

resource "google_compute_subnetwork" "kubernetes-the-hardway-subnet" {
  name          = "kubernetes"
  ip_cidr_range = "10.240.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

#Creation of firewall rules

#Internal firewall create
resource "google_compute_firewall" "k8s-hardway-int" {
  name    = "kubernetes-the-hard-way-allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
  }
  allow {
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.240.0.0/24","10.200.0.0/16"]
}

#External firewall create 

resource "google_compute_firewall" "k8s-hardway-ext" {
  name    = "kubernetes-the-hard-way-allow-external"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

/*
#Kubernetes Public IP Address

resource "google_compute_global_address" "k8s-hard-pubip" {
  name = "kubernetes-the-hard-way"
  project     = "playground-s-11-b1aec1"
}
*/

#Creation of controller Nodes

#Controller-0

resource "google_compute_instance" "controller-0" {
  name         = "controller-0"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.10"
    access_config {
    }
  }
}

#Controller-1

resource "google_compute_instance" "controller-1" {
  name         = "controller-1"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.11"
    access_config {
    }
  }
}

#Controller-2

resource "google_compute_instance" "controller-2" {
  name         = "controller-2"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.12"
    access_config {
    }
  }
}

#Creation of worker nodes

#Worker-0

resource "google_compute_instance" "worker-0" {
  name         = "worker-0"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  metadata = {
    pod-cidr = "10.200.0.0/24"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.20"
    access_config {
    }
  }
}

#Worker-1

resource "google_compute_instance" "worker-1" {
  name         = "worker-1"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  metadata = {
    pod-cidr = "10.200.1.0/24"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.21"
    access_config {
    }
  }
}

#Worker-2

resource "google_compute_instance" "worker-2" {
  name         = "worker-2"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kubernetes-the-hard-way", "controller"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 200
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  metadata = {
    pod-cidr = "10.200.2.0/24"
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kubernetes-the-hardway-subnet.name
    network_ip = "10.240.0.22"
    access_config {
    }
  }
}
  