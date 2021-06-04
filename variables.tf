variable "admin-ip" {
  type        = list(string)
  description = "Your public IP for direct access"
}

variable "project" {
  type        = string
  description = "GCP Project name"
}

variable "username" {
  type        = string
  description = "User name for access and to prefix all resources"
}

variable "region-map" {
  type = map(
    object({
      cidr = string
    })
  )
}
