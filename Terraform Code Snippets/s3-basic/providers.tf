/*
    1. In the `terraform` block, specify the required Terraform version (`~> 1.7`). 
    2. Additionally, define the required providers and their versions. 
    3. In this case, we need the `aws` provider (`~> 5.0`) and the `random` provider (`~> 3.0`).
*/

terraform {
  required_version = "~> 1.7"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }

    random = {
        source = "hashicorp/random"
        version = "~> 3.0"
    }
  }
}

/*
    1. Use the `provider` block to configure the AWS region.
*/

provider "aws" {
  region = "us-east-2"
}

