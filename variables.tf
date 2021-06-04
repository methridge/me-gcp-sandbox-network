variable "admin-ip" {
  description = "Your public IP for direct access"
  type        = list(string)
}

variable "project" {
  description = "GCP Project name"
  type        = string
}

variable "username" {
  description = "User name for access and to prefix all resources"
  type        = string
}

variable "region-map" {
  description = "Object Map of Regions (key) with CIDR block IP range item."
  type = map(
    object({
      cidr = string
    })
  )
}
