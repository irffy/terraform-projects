resource "aws_iam_user" "user" {
  name = "mahanaz"
}
provider "aws" {
   region = "us-east-1"
}