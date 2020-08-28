terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "methridge"

    workspaces {
      name = "me-gcp-sandbox-network"
    }
  }
}
