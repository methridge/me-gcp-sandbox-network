# Terraform module to create GCP sandbox network

This module creates a GCP network and multiple subnets for use as a testing
sandbox. Regions used are US-East4, US-Central1 and US-West3.

## Deploying

- Create `terraform.tfvars` file

  ```hcl
  username        = "awesomeuser"
  project         = "awesomeuser-sandbox"
  region-name-1   = "us-west1"
  region-name-2   = "us-central1"
  region-name-3   = "us-east1"
  subnet-region-1 = "10.13.0.0/20"
  subnet-region-2 = "10.13.16.0/20"
  subnet-region-3 = "10.13.32.0/20"
  admin-ip        = ["200.200.100.100/32"]
  ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.15 |
| google | ~> 3.0 |
| google-beta | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| google | 3.70.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| first-region-cloud-router | terraform-google-modules/cloud-router/google | ~> 1.0 |
| second-region-cloud-router | terraform-google-modules/cloud-router/google | ~> 1.0 |
| third-region-cloud-router | terraform-google-modules/cloud-router/google | ~> 1.0 |
| vpc | terraform-google-modules/network/google | ~> 3.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin-ip | Your public IP for direct access | `list(string)` | n/a | yes |
| project | GCP Project name | `string` | n/a | yes |
| region-name-1 | Name for first Region | `string` | n/a | yes |
| region-name-2 | Name for second region | `string` | n/a | yes |
| region-name-3 | Name for third region | `string` | n/a | yes |
| subnet-region-1 | GCP Subnet for first Region | `string` | n/a | yes |
| subnet-region-2 | GCP Subnet for second Region | `string` | n/a | yes |
| subnet-region-3 | GCP Subnet for third Region | `string` | n/a | yes |
| username | User name for access and to prefix all resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sandbox-network | Self link to the created network |
| sandbox-subnet-region-1 | Self link to the first region subnet |
| sandbox-subnet-region-1-cidr | IP CIDR range for the first region subnet |
| sandbox-subnet-region-2 | Self link to the second region subnet |
| sandbox-subnet-region-2-cidr | IP CIDR range for the second region subnet |
| sandbox-subnet-region-3 | Self link to the third region subnet |
| sandbox-subnet-region-3-cidr | IP CIDR range for the third region subnet |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
