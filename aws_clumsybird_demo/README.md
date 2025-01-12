# Clumsy Bird AWS Infrastructure

This Terraform configuration sets up the infrastructure for the Clumsy Bird project on AWS. It includes a VPC, security group, EC2 instance, and other necessary resources.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account and credentials configured

## Usage

1. **Clone the repository:**

    git clone <repository-url>
    cd <repository-directory>


2. **Initialize Terraform:**

   terraform init

3. **Create a [terraform.tfvars](http://_vscodecontentref_/2) file to specify the required variables:**

    
    region       = "us-east-1"
    owner        = "your-name"
    project      = "clumsy-bird"
    environment  = "dev"
    prefix       = "clumsybird"
    instance_type = "t2.micro"
    

4. **Plan the Terraform deployment:**

    
    terraform plan

5. **Apply the Terraform deployment:**

 
    terraform apply
    

## Resources

### VPC

A VPC is created using the [terraform-aws-modules/vpc/aws](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) module.

- **CIDR:** 10.0.0.0/16
- **Availability Zones:** us-east-1a, us-east-1b, us-east-1c
- **Private Subnets:** 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24
- **Public Subnets:** 10.0.101.0/24, 10.0.102.0/24, 10.0.103.0/24

### Security Group

A security group is created to allow access to the Clumsy Bird application.

- **Ingress Rules:**
  - HTTP (port 80) from anywhere
  - HTTPS (port 443) from anywhere
  - Custom port 8001 from anywhere
- **Egress Rules:**
  - All traffic to anywhere

### EC2 Instance

An EC2 instance is created to host the Clumsy Bird application.

- **AMI:** Latest Ubuntu 20.04 LTS
- **Instance Type:** Specified by the `instance_type` variable
- **Subnet:** First public subnet
- **Security Group:** Clumsy Bird security group
- **User Data:** Script to deploy the application

### Elastic IP

An Elastic IP is associated with the EC2 instance to provide a static public IP address.

## Variables

- **region:** AWS region to deploy the resources
- **owner:** Owner of the resources
- **project:** Project name
- **environment:** Deployment environment (e.g., dev, prod)
- **prefix:** Prefix for resource names
- **instance_type:** EC2 instance type

## Outputs

- **VPC ID:** ID of the created VPC
- **Public Subnets:** List of public subnet IDs
- **Private Subnets:** List of private subnet IDs
- **EC2 Instance ID:** ID of the created EC2 instance
- **Elastic IP:** Elastic IP address associated with the EC2 instance

## Cleanup

To destroy the resources created by this Terraform configuration, run:

sh
terraform destroy