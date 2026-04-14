# Using Data Sources to Fetch AMI Information

## Introduction

In this exercise, we will be exploring the use of AWS data sources in Terraform to retrieve the most recent Ubuntu Amazon Machine Image (AMI). We'll define an output variable to print the ID of the retrieved AMI and use this ID to configure an AWS instance resource.

## Desired Outcome

1. Define an AWS data source to retrieve the most recent Ubuntu AMI.
2. Create an output to print the ID of the retrieved AMI.
3. Create an AWS EC2 instance, using the retrieved Ubuntu AMI ID. Use an instance type that is included in your free tier. Most of the times, this will be a `t2.micro` instance, but it can also be `t3.micro` in regions that do not have `t2.micro` instances available. Make sure to check that beforehand to avoid any unwanted charges!
4. Configure the instance's root block device with a volume size of 10, a volume type of `gp3`, and set it to be deleted on termination.

## Retrieve Ubuntu AMI from other region 

There can be a situation when you need to retrieve AMI ID from the other region. In such cases, we can use the 'provider' argument in the data block to specify the region. Refer the code in 'compute_region_specific.tf'.

1. Define another provider block for the other region with the alias argument.
    e.g., Creating a provider block for EU West region

    ```
        provider "aws" {
            region = "eu-west-1"
            alias  = "eu_west_1"
        }
    ```

2. Define an AWS data source to retieve the most recent Ubuntu AMI with the provider argument and alias as its value.

    ```
        provider = aws.eu_west_1  # Using the alias argument from the provider block to specify the EU West region
    ```


