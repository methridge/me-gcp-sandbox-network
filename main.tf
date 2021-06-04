resource "google_compute_network" "network" {
  name                    = "${var.username}-sandbox-network"
  description             = "${var.username} Sandbox Network"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  project                 = var.project
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each                 = var.region-map
  name                     = "${var.username}-sandbox-subnet-${each.key}"
  ip_cidr_range            = each.value.cidr
  region                   = each.key
  private_ip_google_access = true
  network                  = google_compute_network.network.name
  project                  = var.project
  description              = "${each.key} sandbox subnet"
}

resource "google_compute_route" "route" {
  dest_range       = "0.0.0.0/0"
  name             = "sandbox-egress-internet"
  network          = google_compute_network.network.name
  description      = "Sandbox route through IGW to access internet"
  next_hop_gateway = "default-internet-gateway"
  project          = var.project
  tags             = ["egress-inet"]
}

module "region-cloud-router" {
  for_each = var.region-map
  source   = "terraform-google-modules/cloud-router/google"
  version  = "~> 1.0"
  project  = var.project
  network  = google_compute_network.network.name
  region   = each.key
  name     = "${var.username}-sandbox-${each.key}-router"
  nats = [{
    name = "${var.username}-sandbox-${each.key}-cloud-nat"
  }]
}


# data "google_netblock_ip_ranges" "gcp-ranges" {}

resource "google_compute_firewall" "admin-access" {
  name    = "${var.username}-sandbox-firewall"
  project = var.project
  network = google_compute_network.network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = var.admin-ip
  # source_ranges = concat(
  #   var.admin-ip,
  #   data.google_netblock_ip_ranges.gcp-ranges.cidr_blocks_ipv4
  # )

  source_tags = ["${var.username}-sandbox"]
}


# Manual Firewall Rules

## internet in
### ingress, target http-server, src any, tcp:80, pri:1000
### ingress, target https-server, src any, tcp:443, pri:1000

## internal
### ingress, target all, src 10.13.0.0/16, any, pri:900
### egress, target all, src 10.13.0.0/16, any, pri:900

# Global addresses
## google-managed-services-methridge-sandbox-network  10.13.128.0/20  INTERNAL  VPC_PEERING
