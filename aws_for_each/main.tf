provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = each.value.instance_type

  tags = {
    Name = each.key
  }
}
