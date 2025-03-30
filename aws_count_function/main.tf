provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "multiple_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
 
  tags = {
    Name = "Instance-${count.index + 1}"  # Generates Instance-1, Instance-2, Instance-3
  }
}
