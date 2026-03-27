/*
    1. In the `terraform` block, specify the required Terraform version (`~> 1.12`) and the aws version ('~> 6.0')
*/

terraform {
  required_version = "~> 1.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

/*
    1. Use the `provider` block to configure the AWS region.
*/

provider "aws" {
  region = "us-east-2"
}
