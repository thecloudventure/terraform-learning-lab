## Introduction

In this exercise, we cover the basics of setting up a Terraform project, configuring the AWS provider, creating a random ID for resource naming, creating an AWS S3 bucket, and outputting the bucket name. Let's get started!

## Desired Outcome

1. Set the Terraform version and specify the required providers (`random` and `AWS`).
2. Configure the AWS provider to use the region you are using for the course.
3. Create a Random ID for the AWS S3 bucket name.
4. Create an AWS S3 bucket.
5. Create an output block for the bucket name.
6. After you've written the Terraform configuration, run the following Terraform CLI commands in your terminal:
    - `terraform init`: This command initializes your Terraform workspace by downloading the necessary provider plugins.
    - `terraform plan`: This command shows you what changes Terraform will make to your infrastructure without actually making them.
    - `terraform apply`: This command applies the changes, creating the infrastructure.
    - `terraform destroy`: When you're done with the infrastructure, use this command to remove all resources created by your Terraform configuration.