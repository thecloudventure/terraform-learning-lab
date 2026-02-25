/*
    1. Create a `random_id` resource named `"bucket_suffix"` with a `byte_length` of `6`. 
    2. This ID will be used to create a unique name for the S3 bucket.
*/

resource "random_id" "bucket_suffix" {
  byte_length = 6
}

/*
    1. Create an `aws_s3_bucket` resource named `"example_bucket"`. 
    2. Use interpolation to create a unique bucket name by appending the random ID to `"example-bucket-"`.
*/

resource "aws_s3_bucket" "tcv_s3_bucket" {
  bucket = "tcv-s3-bucket-${random_id.bucket_suffix.hex}"  
}

/*
    1. Finally, use an `output` block to output the name of the created bucket.
*/

output "bucket_name" {
  value = aws_s3_bucket.tcv_s3_bucket.bucket
}
