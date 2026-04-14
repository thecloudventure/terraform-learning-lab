# terraform block with required providers

terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider block to specify the region
provider "aws" {
  region = "us-east-2"
}
