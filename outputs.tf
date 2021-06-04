/**
 * output "network_name" {
 *   value       = google_compute_network.vpc_network.name
 *   description = "The name of the VPC being created"
 * }
 * 
 * output "network_self_link" {
 *   value       = google_compute_network.vpc_network.self_link
 *   description = "The URI of the VPC being created"
 * }
 * 
 * output "project_id" {
 *   value       = google_compute_network.vpc_network.project
 *   description = "VPC project id"
 * }
 * 
 * output "auto" {
 *   value       = google_compute_network.vpc_network.auto_create_subnetworks
 *   description = "The value of the auto mode setting"
 * }
 */

output "sandbox-network" {
  description = "Self link to the created network"
  value       = google_compute_network.network.self_link
}

output "sandbox-subnets" {
  description = "Sandbox Subnetwork Object"
  value       = google_compute_subnetwork.subnetwork[*]
}

# output "sandbox-subnet-region-1" {
#   description = "Self link to the first region subnet"
#   value       = module.vpc.subnets["${var.region-name-1}/${var.username}-sandbox-subnet-region-1"].self_link
# }

# output "sandbox-subnet-region-1-cidr" {
#   description = "IP CIDR range for the first region subnet"
#   value       = module.vpc.subnets["${var.region-name-1}/${var.username}-sandbox-subnet-region-1"].ip_cidr_range
# }

# output "sandbox-subnet-region-2" {
#   description = "Self link to the second region subnet"
#   value       = module.vpc.subnets["${var.region-name-2}/${var.username}-sandbox-subnet-region-2"].self_link
# }

# output "sandbox-subnet-region-2-cidr" {
#   description = "IP CIDR range for the second region subnet"
#   value       = module.vpc.subnets["${var.region-name-2}/${var.username}-sandbox-subnet-region-2"].ip_cidr_range
# }

# output "sandbox-subnet-region-3" {
#   description = "Self link to the third region subnet"
#   value       = module.vpc.subnets["${var.region-name-3}/${var.username}-sandbox-subnet-region-3"].self_link
# }

# output "sandbox-subnet-region-3-cidr" {
#   description = "IP CIDR range for the third region subnet"
#   value       = module.vpc.subnets["${var.region-name-3}/${var.username}-sandbox-subnet-region-3"].ip_cidr_range
# }
