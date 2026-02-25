/*
In this exercise, we will set up a Terraform project, configure the AWS provider, create a random ID for resource naming, create an AWS S3 bucket, and output the bucket name.
*/

// In the `terraform` block, specify the required Terraform version (`~> 1.7`). 
//Additionally, define the required providers and their versions. 
//In this case, we need the `aws` provider (`~> 5.0`) and the `random` provider (`~> 3.0`).

terraform {
    required_version = "~> 1.7"

    required_providers {
      aws = {
        version = "~> 5.0"
        source = "hashicorp/aws"
      }

      random = {
        source = "hashicorp/random"
        version = "~> 3.0"
      }
    }
}

//Use the `provider` block to configure the AWS region to `"eu-west-1"

provider "aws" {
  region = "us-east-2"
}

//Create a `random_id` resource named `"bucket_suffix"` with a `byte_length` of `6`. This ID will be used to create a unique name for the S3 bucket.

resource "random_id" "bucket_suffix" {
  byte_length = 6
}

//Create an `aws_s3_bucket` resource named `"example_bucket"`. Use interpolation to create a unique bucket name by appending the random ID to `"example-bucket-"`.
resource "aws_s3_bucket" "tcv-s3-bucket" {
  bucket = "tcv-s3-bucket-${random_id.bucket_suffix.hex}"
}

//Finally, use an `output` block to output the name of the created bucket.
output "bucket_name" {
  value = aws_s3_bucket.tcv-s3-bucket.bucket
}

/*
6. After you've written the Terraform configuration, run the following Terraform CLI commands in your terminal:
    - `terraform init`: This command initializes your Terraform workspace by downloading the necessary provider plugins.
    - `terraform plan`: This command shows you what changes Terraform will make to your infrastructure without actually making them.
    - `terraform apply`: This command applies the changes, creating the infrastructure.
    - `terraform destroy`: When you're done with the infrastructure, use this command to remove all resources created by your Terraform configuration.
*/

