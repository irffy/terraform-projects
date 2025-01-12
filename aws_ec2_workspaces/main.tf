provider "aws" {
  region = "us-east-1"
}

# Instance types map based on workspaces
variable "instance_types" {
  default = {
    dev   = "t2.micro"
    qa    = "t2.medium"
    stage = "t2.large"
  }
}

# Selecting the instance type based on the active workspace
locals {
  instance_type = var.instance_types[terraform.workspace]
}

# Calling the EC2 module
module "ec2_instance" {
  source        = "./modules/ec2"
  ami           = "ami-0c02fb55956c7d316" # Replace with your AMI ID
  instance_type = local.instance_type
  name          = "MyInstance-${terraform.workspace}"
}
