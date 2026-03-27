/*
1. Deploy a VPC and a subnet
2. Deploy an internet gateway and associate it with the VPC
3. Setup a route table with a route to the IGW and associate it with the subnet 
*/

# locals block to create project specific tags to group project resources 

locals {
  common_tags = {
    ManagedBy  = "Terraform"
    Project    = "Deploy NGINX Server"
    CostCenter = "1234"
  }
}

# resource block to create VPC
resource "aws_vpc" "prjnginx-vpc" {
  cidr_block = "10.0.0.0/16"

# Using merge function to merge the common tags and resource specific tags
  tags = merge(local.common_tags, {
    Description = "VPC for NGINX server project"
  })
}

# resource block to create a public subnet in VPC
resource "aws_subnet" "prjnignx-public-subnet" {
  
  vpc_id = aws_vpc.prjnginx-vpc.id #associating subnet to vpc
  cidr_block = "10.0.0.0/24"

  # Using merge function to merge the common tags and resource specific tags
  tags = merge(local.common_tags, {
    Description = "Public subnet for the NGINX server project"
  })
}

# resource block to create a internet gateway in VPC
resource "aws_internet_gateway" "prjnginx-internet-gateway" {
  
  vpc_id = aws_vpc.prjnginx-vpc.id #associating internet gateway to vpc
  # Using merge function to merge the common tags and resource specific tags
  tags = merge(local.common_tags, {
    Description = "Internet gateway for the NGINX server project"
  })
}

# resource block to create a route table
resource "aws_route_table" "prjnginx-route-table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id #associating route table to the internet gateway
  }

  tags = merge(local.common_tags, {
    Description = "Route table for the NGINX server project"
  })
}

# resource block to create a route table association
resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.prjnignx-public-subnet.id #associating subnet id to the route table
  route_table_id = aws_route_table.prjnginx-route-table.id
}
