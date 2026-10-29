# terraform-aws-modules

Reusable Terraform modules for the GenAI Infrastructure Platform lab.

## Modules

| Module | Purpose | Security defaults |
|---|---|---|
| S3 | Create an S3 bucket | Public access blocked, AES-256 encryption, bucket-owner-enforced ownership, versioning enabled by default |

## Usage

```hcl
module "documents_bucket" {
  source = "git::https://github.com/aldo2510/terraform-aws-modules.git//modules/s3?ref=main"
  bucket_name = "example-customer-documents-dev"
  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
    DataClass   = "internal"
  }
}
```

Configure the AWS provider in the calling root module. This repository contains modules only; it does not deploy infrastructure on its own.

Validate modules against [cloud-governance](https://github.com/aldo2510/cloud-governance). Pin a reviewed commit SHA or release tag in production rather than using main.
