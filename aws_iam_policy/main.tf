resource "aws_iam_policy" "example" {
  name        = "S3PolicyTerraform"
  description = "An example policy for S3 bucket access using Terraform"

  policy = file("policy.json")
}
