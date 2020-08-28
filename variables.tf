variable "username" {
  type        = string
  description = "User name for access and to prefix all resources"
}

variable "project" {
  type        = string
  description = "GCP Project name"
}

variable "region-name-1" {
  type        = string
  description = "Name for first Region"
}

variable "region-name-2" {
  type        = string
  description = "Name for second region"
}

variable "region-name-3" {
  type        = string
  description = "Name for third region"
}

variable "subnet-region-1" {
  type        = string
  description = "GCP Subnet for first Region"
}

variable "subnet-region-2" {
  type        = string
  description = "GCP Subnet for second Region"
}

variable "subnet-region-3" {
  type        = string
  description = "GCP Subnet for third Region"
}

variable "admin_ip" {
  type        = list(string)
  description = "Your public IP for direct access"
}
