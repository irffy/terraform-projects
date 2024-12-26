provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2SecurityGroup"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI ID (region-specific, update as needed)
  instance_type = "t2.micro"
  key_name      = "aws-key" # Replace with your existing key pair name
  subnet_id     = aws_subnet.public_subnet.id
#   security_groups = [aws_security_group.ec2_sg.name]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  depends_on = [aws_security_group.ec2_sg]

  tags = {
    Name = "MyEC2Instance"
  }

  provisioner "file" {
    source      = "app.py"
    destination = "/home/ec2-user/app.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y python3",
      "python3 -m pip install --upgrade pip",
      "nohup python3 /home/ec2-user/app.py &"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("key/aws-key.pem")  # Replace with your private key path
      host        = self.public_ip
    }
  }
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
