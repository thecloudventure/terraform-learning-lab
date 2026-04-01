# resource block to create a random id which will be used to create a unique bucket name
resource "random_id" "s3_bucket_suffix" {
  byte_length = 4
}

#resource block to create a S3 bucket
resource "aws_s3_bucket" "static_website_bucket" {

  #creating a unique name for the bucket using the random id
  bucket = "s3-static-website-bucket-${random_id.s3_bucket_suffix.hex}"
}

# resource block to disable public access block
resource "aws_s3_bucket_public_access_block" "public_access_block" {

  bucket                  = aws_s3_bucket.static_website_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

/*
 resource block to create a policy that allows the `s3:GetObject` action for anyone
 and for all objects within the created bucket.
*/

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({

    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.static_website_bucket.arn}/*"
      }
    ]
    }
  )
}

# resource block to create static website configuration
resource "aws_s3_bucket_website_configuration" "static_website_cofiguration" {
  
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# resource block to upload the index.html file to the S3 bucket
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key = "index.html"
  source = "build/index.html"
  etag = filemd5("build/index.html")
  content_type = "text/html"
}

# resource block to upload the error.html file to the S3 bucket
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key = "error.html"
  source = "build/error.html"
  etag = filemd5("build/error.html")
  content_type = "text/html"
}
