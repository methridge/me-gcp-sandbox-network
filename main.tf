provider "google" {
  version = "~> 3.19"
}

module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 2.3"
  description  = "${var.username} Sandbox Network"
  project_id   = var.project
  network_name = "${var.username}-sandbox-network"

  subnets = [
    {
      subnet_name           = "${var.username}-sandbox-subnet-west3"
      subnet_ip             = var.subnet-west3
      subnet_region         = "us-west3"
      subnet_private_access = "true"
      description           = "US West 3 region Sandbox subnet"
    },
    {
      subnet_name           = "${var.username}-sandbox-subnet-central1"
      subnet_ip             = var.subnet-central1
      subnet_region         = "us-central1"
      subnet_private_access = "true"
      description           = "US Central 1 region Sandbox subnet"
    },
    {
      subnet_name           = "${var.username}-sandbox-subnet-east4"
      subnet_ip             = var.subnet-east4
      subnet_region         = "us-east4"
      subnet_private_access = "true"
      description           = "US East 4 region Sandbox subnet"
    }
  ]

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}

module "us-west3-cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.1"
  project = var.project
  network = module.vpc.network_name
  region  = "us-west3"
  name    = "${var.username}-sandbox-us-west3-router"
}

module "us-west3-cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.3.0"
  project_id = var.project
  router     = module.us-west3-cloud_router.router.name
  region     = "us-west3"
  name       = "${var.username}-sandbox-us-west3-cloud-nat"
}

module "us-central1-cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.1"
  project = var.project
  network = module.vpc.network_name
  region  = "us-central1"
  name    = "${var.username}-sandbox-us-central1-router"
}

module "us-central1-cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.3.0"
  project_id = var.project
  router     = module.us-central1-cloud_router.router.name
  region     = "us-central1"
  name       = "${var.username}-sandbox-us-central1-cloud-nat"
}

module "us-east4-cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.1"
  project = var.project
  network = module.vpc.network_name
  region  = "us-east4"
  name    = "${var.username}-sandbox-us-east4-router"
}

module "us-east4-cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.3.0"
  project_id = var.project
  router     = module.us-east4-cloud_router.router.name
  region     = "us-east4"
  name       = "${var.username}-sandbox-us-east4-cloud-nat"
}

resource "google_compute_firewall" "default" {
  name    = "${var.username}-sandbox-firewall"
  project = var.project
  network = module.vpc.network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = var.admin_ip

  source_tags = ["${var.username}-sandbox"]
}
