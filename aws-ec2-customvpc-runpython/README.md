# Simple Python App on AWS EC2

This project sets up a simple Python application that runs on port 80 on an AWS EC2 instance. The infrastructure is managed using Terraform.

## Prerequisites

- Terraform installed
- AWS CLI configured with appropriate credentials
- An existing AWS key pair for SSH access

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/your-repo/simple-python-app.git
    cd simple-python-app
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

4. Confirm the apply step by typing `yes`.

5. After the apply step completes, note the public IP address of the EC2 instance from the output.

## Access the Application

Open a web browser and navigate to `http://<EC2_PUBLIC_IP>`. You should see "Hello World" displayed.

## Cleanup

To destroy the infrastructure created by Terraform, run:
```sh
terraform destroy

Files
main.tf: Terraform configuration file to set up the AWS infrastructure.
app.py: Simple Python application to be run on the EC2 instance.
README.md: This file.