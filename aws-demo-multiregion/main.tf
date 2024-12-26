resource "aws_instance" "us-east-1" {
  provider = aws.us-east-1
  ami = var.ami_value
  instance_type = var.instance_type_value
  tags = {
    Name = "Terraform-us-east-1"
  }
}

resource "aws_instance" "us-west-1" {
  provider = aws.us-west-1
  ami = "ami-0aa117785d1c1bfe5"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-us-west-1"
  }
}