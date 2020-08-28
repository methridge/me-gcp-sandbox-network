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
  admin_ip        = ["200.200.100.100/32"]
  ```

## Inputs

| Name            | Description                                      |     Type     | Required |
| :-------------- | :----------------------------------------------- | :----------: | :------: |
| username        | User name for access and to prefix all resources |    string    |   yes    |
| project         | GCP Project name                                 |    string    |   yes    |
| region-name-1   | GCP Name for first Region                        |    string    |   yes    |
| region-name-2   | GCP Name for second region                       |    string    |   yes    |
| region-name-3   | GCP Name for third region                        |    string    |   yes    |
| subnet-region-1 | GCP Subnet for first Region                      |    string    |   yes    |
| subnet-region-2 | GCP Subnet for second Region                     |    string    |   yes    |
| subnet-region-3 | GCP Subnet for third Region                      |    string    |   yes    |
| admin_ip        | Your public IP for direct access                 | list(string) |   yes    |

## Outputs

| Name                         | Description                                |
| :--------------------------- | :----------------------------------------- |
| sandbox-network              | Self link to the created network           |
| sandbox-subnet-region-1      | Self link to the first region subnet       |
| sandbox-subnet-region-1-cidr | IP CIDR range for the first region subnet  |
| sandbox-subnet-region-2      | Self link to the second region subnet      |
| sandbox-subnet-region-2-cidr | IP CIDR range for the second region subnet |
| sandbox-subnet-region-3      | Self link to the third region subnet       |
| sandbox-subnet-region-3-cidr | IP CIDR range for the third region subnet  |
