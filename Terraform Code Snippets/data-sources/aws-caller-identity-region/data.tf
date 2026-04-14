# Data block to retrieve aws caller identity
data "aws_caller_identity" "current" {}

# Data block to retrieve aws region
data "aws_region" "current" {}

# output the caller identity
output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

# output the region
output "aws_region" {
  value = data.aws_region.current
}