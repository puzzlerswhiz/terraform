# Terraform Basics on Google Cloud (GCP)

## 1. What is Terraform?
Terraform is an Infrastructure as Code (IaC) tool that allows you to define, provision,
update, and delete Google Cloud infrastructure using declarative configuration files.

Terraform works by:
- Reading `.tf` files
- Comparing desired state vs actual state in GCP
- Calling Google Cloud APIs
- Reconciling differences automatically

## 2. Why Terraform is Used on GCP
- Consistent infrastructure provisioning
- Version-controlled infrastructure
- Safer changes using `terraform plan`
- CI/CD friendly
- Prevents configuration drift

## 3. Core Concepts

### Provider (GCP)
```hcl
provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
  zone    = "us-central1-a"
}
```

### Resource
A resource represents a GCP service such as Compute Engine, Cloud SQL, or Cloud Storage.

### State
Terraform stores resource mappings in `terraform.tfstate`.

## 4. Terraform Folder Structure
```text
terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfstate
```

## 5. Common Terraform Commands
```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

## 6. GCP Networking Model
- VPC is global
- Subnets are regional
- No resource groups

## 7. Compute Engine Example
```hcl
resource "google_compute_instance" "vm" {
  name         = "vm-demo"
  machine_type = "e2-medium"
}
```

## 8. Cloud SQL Example
```hcl
resource "google_sql_database_instance" "mysql" {
  name             = "mysql-demo"
  database_version = "MYSQL_8_0"
}
```

## 9. Cloud Storage Example
```hcl
resource "google_storage_bucket" "bucket" {
  name     = "demo-bucket"
  location = "US"
}
```

## 10. Cleanup
```bash
terraform destroy
```