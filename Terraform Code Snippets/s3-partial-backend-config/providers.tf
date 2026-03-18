/*
    `terraform` block, with the required Terraform version (`~> 1.7`) & the `aws` provider (`~> 5.0`).    
*/

terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  /*
  Create the `backend "s3"` block 
  Remove the specific backend key and will instead be using a key that includes the environment from a `tfbackend` file.
*/

  backend "s3" {
    bucket = "my-terraform-state-bucket"
    region = "us-east-2"
  }
}

/*
    `provider` block to configure the AWS region.
*/

provider "aws" {
  region = "us-east-2"
}

