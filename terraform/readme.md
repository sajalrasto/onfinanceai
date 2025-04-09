# OnFinance AI Terraform Infrastructure

## Requirements
- Terraform v1.0+
- AWS CLI configured
- kubectl

## Deployment

1. Initialize Terraform:
```bash
terraform init
```

2. Review planned changes:
```bash
terraform plan
```

3. Apply configuration:
```bash
terraform apply
```

## Inputs
Configure via `terraform.tfvars`:
```hcl
region            = "us-east-1"
database_username = "admin"
database_password = "securepassword123"
```

## Outputs
After deployment, configure kubectl:
```bash
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```
