provider "aws" {
  region = "us-east-1"
}

# Define the S3 bucket
resource "aws_s3_bucket" "s3bucket" {
  bucket = "my-first-tabz-bucket-tf" # Change this to a globally unique name
  acl    = "private"
  tags = {
    Environment = "Dev"
    Project     = "Sapphire"
  }
}


# Define the S3 bucket policy
resource "aws_s3_bucket_policy" "s3bucketpolicy-example" {
  bucket = aws_s3_bucket.s3bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject"
        ],
        Resource = "${aws_s3_bucket.s3bucket.arn}/*"
      }
    ]
  })
}

output "bucket_name" {
  value = aws_s3_bucket.s3bucket.bucket
}
