provider "google" {
  project     = var.project_id
  credentials = file(var.gcp_terraform_credentials)
  region      = var.region
  zone        = var.zone
}

terraform {
  required_providers {
    google = {
      version = "~> 4.54.0"
    }
  }
}
