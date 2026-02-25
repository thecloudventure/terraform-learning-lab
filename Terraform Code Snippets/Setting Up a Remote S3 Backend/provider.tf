// In this exercise, we will set up an S3 backend for Terraform.
// In the `terraform` block, specify the required Terraform version (`~> 1.7`). 

terraform {
  
  required_version = "~> 1.7"

  required_providers {
    
    aws = {
        version = "~> 5.0"
        source = "hashicorp/aws"
    }

    random = {
        version = "~> 3.0"
        source = "hashicorp/random"
    }
  }

  /*Configure the S3 backend in your Terraform configuration. This is done in the `backend "s3"` block in your configuration file */

  backend "s3" {
    bucket = "tcv-s3-bucket-0001" //bucket name
    key = "state.tfstate" 
    region = "us-east-2" //region where bucket is located. Can be different than the region in provider block
  }

}

provider "aws" {
  region = "us-east-2"
}