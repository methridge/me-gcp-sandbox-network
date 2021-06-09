terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.5"
    }
  }
  required_version = ">= 0.15"
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "methridge"
    workspaces {
      name = "me-gcp-sandbox-network"
    }
  }
}
