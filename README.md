![Terraform CI/CD](https://github.com/akeenalee/azure-3tier-terraform/actions/workflows/terraform.yml/badge.svg)
# Azure 3-Tier Infrastructure — Terraform IaC

## Architecture
- **Networking**: Azure VNet, Subnets, NSG with security rules
- **Compute**: Azure Container Instance (nginx)
- **Database**: Azure SQL Server + Database
- **Monitoring**: Azure Monitor alerts (CPU, Memory) → email notification
- **IaC**: 100% Terraform — no manual portal clicks

## Prerequisites
- Terraform CLI >= 1.7
- Azure CLI authenticated
- Azure subscription

## Deploy
```bash
terraform init
terraform plan
terraform apply
```

## Destroy
```bash
terraform destroy
```

## What I learned
- Terraform resource dependencies and state management
- Azure VNet/Subnet/NSG configuration as code
- Real-world state drift recovery using `terraform import`
- Azure Monitor metric alerts via Terraform