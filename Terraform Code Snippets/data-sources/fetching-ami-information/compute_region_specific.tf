/*
    Create a data block with provider argument to retrieve AMI ID for a specific region    
*/

data "aws_ami" "ubuntu_instance_eu" {
  
  most_recent = true        # If more than one result is returned, use the most recent AMI.
  owners = ["099720109477"] # Owner is Canonical Ltd. The company behind Ubuntu."]
  provider = aws.eu_west_1  # Using the alias argument from the provider block to specify the EU West region

  #use filters to only retrieve the AMIs that match our criteria
  filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
      }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }  
}

# Define an output variable to print the ID of the AMI we have retrieved.
output "ubuntu_ami_data_eu" {
    value = data.aws_ami.ubuntu_instance_eu.id
}

# Define an AWS instance resource using the AMI ID of the Ubuntu AMI we retrieved from the Data block.
resource "aws_instance" "data_source_instance" {
  
  ami = data.aws_ami.ubuntu_instance.id # AMI ID retrieved using the data source
  instance_type = "t2.micro"            # Specify the instance type to be `t2.micro`

    /*
        Specify the root block device configuration to have a volume size of 10, a volume type of `gp3`
        Set it to be deleted on termination
    */
  root_block_device {
    
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp3"
  }  
}