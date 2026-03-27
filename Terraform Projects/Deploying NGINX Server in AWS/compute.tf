/*
Deploy an EC2 instance inside of the created subnet and associate a public IP
Associate a security group that allows public ingress
*/

# resource block for the EC2 instance
resource "aws_instance" "prjnginx-ec2-instance" {
/*  
  Retireve the latest ami from https://cloud-images.ubuntu.com/locator/ec2
  AMI ID NGINX  = ami-0dfee6e7eb44d480b
  AMI ID Ubuntu = ami-0652a081025ec9fee
  Set the ami based on the instance being created.
*/

  ami                         = "ami-0dfee6e7eb44d480b"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.prjnignx-public-subnet.id #subnet where the instance will be created
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = merge(local.common_tags, {
    Description = "EC2 instance for the NGINX project"
  })

  lifecycle {
    create_before_destroy = true
  }
}

# resource block for the security group
resource "aws_security_group" "prjnginx-security-group" {
  vpc_id = aws_vpc.prjnginx-vpc.id
  
  tags = merge(local.common_tags, {
    Description = "Security group for the NGINX project"
  })
}

#resource block for the security group ingress rule for port 80
resource "aws_vpc_security_group_ingress_rule" "prjnginx-sgr-ingress" {
  security_group_id = aws_security_group.prjnginx-security-group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}

#resource block for the security group ingress rule for port 443
resource "aws_vpc_security_group_ingress_rule" "prjnginx-sgr-ingress" {
  security_group_id = aws_security_group.prjnginx-security-group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  to_port = 443
  ip_protocol = "tcp"
}

