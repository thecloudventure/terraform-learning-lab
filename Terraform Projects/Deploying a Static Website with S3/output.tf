# output block to output the static website endpoint

output "satic_website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_website_cofiguration.website_endpoint
}