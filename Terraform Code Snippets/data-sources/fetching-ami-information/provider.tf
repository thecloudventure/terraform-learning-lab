# terraform block with required providers

terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }    
  }
}

#provider block to specify the region
provider "aws" {
  region = "us-east-2"
}

#provider block to specify the EU region to retrieve AMI ID for EU region
provider "aws" {
  region = "eu-west-1"
  alias = "eu_west_1"   # Identifier for EU West region
}