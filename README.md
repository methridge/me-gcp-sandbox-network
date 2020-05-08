# Terraform module to create GCP sandbox network

This module creates a GCP network and multiple subnets for use as a testing
sandbox. Regions used are US-East4, US-Central1 and US-West3.

## Deploying

- Create `terraform.tfvars` file

  ```hcl
  creds           = "/Users/awesomeuser/.config/gcloud/creds/awesomeuser-creds.json"
  username        = "awesomeuser"
  project         = "awesomeuser-sandbox"
  subnet-west3    = "10.13.0.0/20"
  subnet-central1 = "10.13.16.0/20"
  subnet-east4    = "10.13.32.0/20"
  admin_ip        = ["200.200.100.100/32"]
  ```

## Inputs

| Name            | Description                                      |     Type     | Required |
| :-------------- | :----------------------------------------------- | :----------: | :------: |
| creds           | Full path to your GCP credentials file           |    string    |   yes    |
| username        | User name for access and to prefix all resources |    string    |   yes    |
| project         | GCP Project name                                 |    string    |   yes    |
| subnet-west3    | GCP Subnet for West-3 Region                     |    string    |   yes    |
| subnet-central1 | GCP Subnet for Central-1 Region                  |    string    |   yes    |
| subnet-east4    | GCP Subnet for East-4 Region                     |    string    |   yes    |
| admin_ip        | Your public IP for direct access                 | list[string] |   yes    |

## Outputs

| Name                         | Description                              |
| :--------------------------- | :--------------------------------------- |
| sandbox-network              | Self link to the created network         |
| sandbox-subnet-west3         | Self link to the US-West3 subnet         |
| sandbox-subnet-west3-cidr    | IP CIDR range for the US-West3 subnet    |
| sandbox-subnet-central1      | Self link to the US-Central1 subnet      |
| sandbox-subnet-central1-cidr | IP CIDR range for the US-Central1 subnet |
| sandbox-subnet-east4         | Self link to the US-East4 subnet         |
| sandbox-subnet-east4-cidr    | IP CIDR range for the US-East4 subnet    |
