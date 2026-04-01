# terraform block with required providers
# using a random provider to provide a unique name to the S3 bucket

terraform {
  required_version = "~> 1.12 "
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.38.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.8.0"
    }
  }
}

#provider block to specify the region
provider "aws" {
  region = "us-east-2"
}