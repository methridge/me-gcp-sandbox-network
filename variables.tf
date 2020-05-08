variable "username" {
  description = "User name for access and to prefix all resources"
}

variable "project" {
  description = "GCP Project name"
}

variable "subnet-west3" {
  description = "GCP Subnet for West-3 Region"
}

variable "subnet-central1" {
  description = "GCP Subnet for Central-1 Region"
}

variable "subnet-east4" {
  description = "GCP Subnet for East-4 Region"
}

variable "admin_ip" {
  description = "Your public IP for direct access"
}
