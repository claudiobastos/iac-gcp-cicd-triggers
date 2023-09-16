provider "google" {
  project     = var.project_id
  credentials = file(var.gcp_credentials)
}

terraform {
  required_providers {
    google = {
      version = "~> 4.54.0"
    }
  }
}
