terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0"
}

provider "google" {
  project = "fleet-rite-470708-u1"
  region  = "europe-west3"
}

# VPC Network
resource "google_compute_network" "main_vpc" {
  name                    = "ecommerce-vpc"
  auto_create_subnetworks = false
  description             = "Main VPC for e-commerce application"
}

# Web subnet
resource "google_compute_subnetwork" "web_subnet" {
  name          = "web-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west3"
  network       = google_compute_network.main_vpc.id
  description   = "Subnet for web tier resources"
}

# App subnet
resource "google_compute_subnetwork" "app_subnet" {
  name          = "app-subnet" 
  ip_cidr_range = "10.0.2.0/24"
  region        = "europe-west3"
  network       = google_compute_network.main_vpc.id
  description   = "Subnet for application tier"
}

# Firewall rule for web traffic
resource "google_compute_firewall" "web_firewall" {
  name    = "allow-web-traffic"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
  description   = "Allow HTTP, HTTPS, and app traffic"
}

# Firewall rule for SSH
resource "google_compute_firewall" "ssh_firewall" {
  name    = "allow-ssh"
  network = google_compute_network.main_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-server"]
  description   = "Allow SSH access"
}

# Output values
output "vpc_id" {
  value       = google_compute_network.main_vpc.id
  description = "VPC network ID"
}

output "web_subnet_id" {
  value       = google_compute_subnetwork.web_subnet.id
  description = "Web subnet ID"
}

output "app_subnet_id" {
  value       = google_compute_subnetwork.app_subnet.id
  description = "App subnet ID"
}

output "project_id" {
  value       = "fleet-rite-470708-u1"
  description = "GCP Project ID"
}
