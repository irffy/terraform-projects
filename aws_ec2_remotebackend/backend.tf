terraform {
  backend "s3" {
    bucket         = "tabz-terraformstate"   # Replace with your S3 bucket name
    key            = "ec2/terraform.tfstate"    # Path to store the state file
    region         = "us-east-1"                # Replace with your AWS region
    encrypt        = true
    dynamodb_table = "terraform-lock-table"     # Ensure this table exists
  }
}
