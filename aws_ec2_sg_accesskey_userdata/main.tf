provider "aws" {
  region = "us-east-1" # Replace with your AWS region
}

# Security Group
resource "aws_security_group" "ssh-access" {
  name_prefix = "ssh-sg-ec2"
  description = "Security group to provide SSH access"

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow SSH from all IPs
  }

  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow HTTP from all IPs
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "ec2-server1" {
  ami           = "ami-0c02fb55956c7d316" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  key_name      = aws_key_pair.example.key_name
  security_groups = [aws_security_group.ssh-access.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Terraform-EC2"
  }
}

# Key Pair
resource "aws_key_pair" "example" {
  key_name   = "example-key"
# public_key = file("~/.ssh/id_rsa.pub") # Path to your public key file
  public_key = file("${path.module}/terraform-keypair.pem")
}

# Output Values
output "instance_public_ip" {
  value = aws_instance.ec2-server1.public_ip
}

output "key_name" {
  value = aws_key_pair.example.key_name
}
