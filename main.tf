terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "dulcet-eagle-419518"
region = "us-central1"
zone = "us-central1-a"
credentials = "dulcet-eagle-419518-5f8c59a8f5cc.json"

}

resource "google_storage_bucket" "noratchetsbucket" {
  name          = "myversionbucket"
  location      = "US"
  force_destroy = true

}
resource "google_compute_network" "auto-vpc-tf" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name ="sub-sg"
  network = google_compute_network.auto-vpc-tf.id
  ip_cidr_range = "10.72.1.0/24"
  region = "us-central1"
}


#resource "google_compute_network" "custom-vpc-tf" {
  #name = "custom-vpc-tf"
 #auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}