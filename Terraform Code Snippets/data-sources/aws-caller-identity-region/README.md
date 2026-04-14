# Using Data Sources to Fetch AWS Caller Identity and Region

## Introduction

In this exercise, we will be focusing on understanding and utilizing the AWS Caller Identity and AWS Region Data Sources. The aim is to define data sources for both AWS Caller Identity and AWS Region. Then, we will output the returned identity of the caller and the current AWS region. 

## Desired Outcome

1. AWS Caller Identity Data Source: This data source should be defined to return the identity of the caller.
2. AWS Region Data Source: This data source should be defined to get the current AWS region.
3. AWS Caller Identity Output: This output should return the identity of the caller.
4. AWS Region Output: This output should return the current AWS region.

## Step-by-Step Guide

1.  First, define the data source for the AWS Caller Identity. This data source is used to return the identity of the caller. This is achieved with the following code:

    ```
    data "aws_caller_identity" "current" {}
    ```

2.  Next, define the data source for the AWS Region. This data source is used to get the current region. This is done with the following code:

    ```
    data "aws_region" "current" {}
    ```

3.  Then, output the AWS Caller Identity. This will return the identity of the caller. This is done with the following code:

    ```
    output "aws_caller_identity" {
      value = data.aws_caller_identity.current
    }
    ```

4.  Finally, output the AWS Region. This will return the current region. This is done with the following code:

    ```
    output "aws_region" {
      value = data.aws_region.current
    }
    ```
# Overview of the exercise

This exercise introduces additional AWS data sources in Terraform and explains how they can be used to dynamically retrieve information instead of hardcoding values in your configuration.

1. AWS Caller Identity Data Source

    - It belongs to STS (Security Token Service) section in the Terraform AWS provider.
    - This data source provides:
        - Account ID
        - User ID
        - ARN (Amazon Resource Name) of the authenticated user

## Purpose & Usage

    - Mainly used to retrieve AWS account dynamically
    - Useful when creating IAM policies or constructing ARNs for roles, users, or resources
    - Avoids hardcoding sensitive or environment specific values.

2. AWS Region Data Source

    - Found under metadata sources in the Terraform registry. 
    - It provides 
        - Region Name
        - EC2 endpoint
        - Region Description

## Purpose & Usage

    - Mainly used to retrieve AWS region name dynamically
    - Use region info in:
        - Resource Description
        - Configurations dependent on region

3. Provider Meta Argument

Provider is a meta-argument 

    - Not listed in argument reference 
    - Available across all resources and data sources 

Why It Matters
    - Allows querying different AWS regions by: 
        - Creating multiple provider instances with aliases 
        - Assigning a specific provider to a data source 

Example Concept
    - Create a second AWS provider with alias (e.g., us_east) 
    - Attach it to the data source 
    - Terraform then fetches data from that specific region 




