# Three-Tier Web Application on AWS using Terraform

This repository implements a scalable three-tier architecture on AWS using Terraform. The architecture includes:

- **Frontend Tier**: EC2 instances behind an Application Load Balancer (ALB), in public subnets.
- **Backend Tier**: EC2 instances in private subnets behind a private ALB.
- **Database Tier**: Highly available RDS (MySQL) setup in private subnets.
- **Networking**: Custom VPC with proper subnet segmentation, routing, and security groups.
- **Observability**: CloudWatch and SNS support included in the design.
- **Environments**: Separate configurations for `dev`, `staging`, and `production`.

---

## 📁 Project Structure

```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
├── environments/
│   ├── dev/backend.tfvars
│   ├── staging/backend.tfvars
│   └── production/backend.tfvars
└── modules/
    ├── vpc/
    ├── ec2/
    ├── alb/
    ├── rds/
    └── security_groups/
```

---

## 🚀 Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- An AWS account
- AWS credentials configured locally (`~/.aws/credentials` or via `aws configure`)

### Deployment Steps

```bash
cd terraform
terraform init
terraform plan -var-file=environments/dev/backend.tfvars
terraform apply -var-file=environments/dev/backend.tfvars
```

Swap `dev` with `staging` or `production` as needed.

---

## 🧹 Cleanup

To tear down the environment:

```bash
terraform destroy -var-file=environments/dev/backend.tfvars
```
