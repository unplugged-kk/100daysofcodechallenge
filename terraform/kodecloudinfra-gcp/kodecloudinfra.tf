#GCP Auth Setup

provider "google" {
  credentials = file("k8shard-tf.json")
  project     = "devops-automation-279808"
  region      = "us-west1"
}

#Creation of VPC NW 

resource "google_compute_network" "vpc_network" {
  name = "kodecloud-infra"
  auto_create_subnetworks = "false"
}

#Creation of subnet 

resource "google_compute_subnetwork" "kodecloud-infra-subnet" {
  name          = "kodecloud-subnet1"
  ip_cidr_range = "10.240.0.0/24"

  
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

#Creation of firewall rules

#Internal firewall create
resource "google_compute_firewall" "kodecloud-fw-int" {
  name    = "kodecloud-fw-allow-internal"
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
  source_ranges = ["10.240.0.0/24"]
}

#External firewall create 

resource "google_compute_firewall" "kodecloud-fw-ext" {
  name    = "kodecloud-fw-allow-external"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

#Creation of kodecloud-infra Nodes

#kodecloud-master-0

resource "google_compute_instance" "master-0" {
  name         = "kodecloud-master-0"
  machine_type = "e2-standard-2"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kodecloud-infra"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20200714"
      size = 100
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
   ssh-keys = "kishore:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kodecloud-infra-subnet.name
    network_ip = "10.240.0.10"
    access_config {
    }
  }
}

#kodecloud-slave-0

resource "google_compute_instance" "slave-0" {
  name         = "kodecloud-slave-0"
  machine_type = "e2-medium"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kodecloud-infra"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20200714"
      size = 50
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
   ssh-keys = "kishore:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kodecloud-infra-subnet.name
    network_ip = "10.240.0.11"
    access_config {
    }
  }
}

#kodecloud-slave-1

resource "google_compute_instance" "slave-1" {
  name         = "kodecloud-slave-1"
  machine_type = "e2-medium"
  zone         = "us-west1-c"
  can_ip_forward       = true
  tags = ["kodecloud-infra"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7-v20200714"
      size = 50
    }
  }
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  metadata = {
   ssh-keys = "kishore:${file("~/.ssh/id_rsa.pub")}"
 }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.kodecloud-infra-subnet.name
    network_ip = "10.240.0.12"
    access_config {
    }
  }
}


