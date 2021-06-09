# Terraform module to create GCP sandbox network

This module creates a GCP network and multiple subnets for use as a testing
sandbox. Regions and their subnets are specified in an object map.

## Deploying

- Create `terraform.tfvars` file

  ```hcl
  admin-ip        = ["200.200.100.100/32"]
  project         = "awesomeuser-sandbox"
  username        = "awesomeuser"
  region-map = {
    "us-west1" = {
      "cidr" = "10.13.0.0/20"
    }
    "us-central1" = {
      "cidr" = "10.13.16.0/20"
    }
    "us-east1" = {
      "cidr" = "10.13.32.0/20"
    }
  }
  ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.15 |
| google | >= 3.5 |

## Providers

| Name | Version |
|------|---------|
| google | 3.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| region-cloud-router | terraform-google-modules/cloud-router/google | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.admin-access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_route.route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin-ip | Your public IP for direct access | `list(string)` | n/a | yes |
| project | GCP Project name | `string` | n/a | yes |
| region-map | Object Map of Regions (key) with CIDR block IP range item. | <pre>map(<br>    object({<br>      cidr = string<br>    })<br>  )</pre> | n/a | yes |
| username | User name for access and to prefix all resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sandbox-network | Self link to the created network |
| sandbox-subnets | Sandbox Subnetwork Object |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
