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
resource "google_storage_bucket" "noscragsbucket" {
  name          = "myversionbucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}