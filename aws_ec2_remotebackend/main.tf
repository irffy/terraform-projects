provider "aws" {
  region = "us-east-1" # Replace with your region
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}
