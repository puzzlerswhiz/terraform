terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc" {
  name                    = "vpc-demo"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-demo"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_instance" "vm" {
  name         = "vm-demo"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {}
  }
}

resource "google_sql_database_instance" "mysql" {
  name             = "mysql-demo-instance"
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "appdb" {
  name     = "appdb"
  instance = google_sql_database_instance.mysql.name
}

resource "google_storage_bucket" "bucket" {
  name     = "${var.project_id}-terraform-demo-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "sample" {
  name    = "sample.txt"
  bucket = google_storage_bucket.bucket.name
  content = "Terraform on GCP demo file"
}