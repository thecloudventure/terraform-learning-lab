/*
    1. In the `terraform` block, specify the required Terraform version (`~> 1.7`). 
        3. In this case, we need the `aws` provider (`~> 5.0`).
    
*/

terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }    
  }

    /*
        1. Configure the S3 backend for storing the Terraform state file.
        2. Specify the bucket name, key (path to the state file), and region.
        3. This allows Terraform to store the state file remotely in an S3 bucket, enabling collaboration and state management across teams.
        4. Make sure to replace the bucket name and key with your own values.
    */

    backend "s3" {
        bucket = "my-terraform-state-bucket"
        key    = "state.tfstate"
        region = "us-east-2"
    }
}

/*
    1. Use the `provider` block to configure the AWS region.
*/

provider "aws" {
  region = "us-east-2"
}