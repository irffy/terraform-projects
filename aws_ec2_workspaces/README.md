# Terraform EC2 Module with Workspaces

This project demonstrates how to use Terraform modules and workspaces to manage EC2 instances in different environments (dev, qa, stage). The EC2 instance type and other configurations are parameterized based on the active workspace.

## Project Structure

```
.
├── main.tf                 # Root module to configure EC2 using the module
├── modules
│   └── ec2
│       ├── main.tf         # EC2 module for creating an instance
│       ├── variables.tf    # Variables for the EC2 module
```

## Features

- Reusable EC2 Terraform module.
- Workspace-specific configurations for instance types and other variables.
- Dynamically sets configurations based on the active workspace.
- Tags for environment identification.

## Prerequisites

1. [Terraform installed](https://developer.hashicorp.com/terraform/downloads).
2. AWS CLI configured with appropriate credentials.
3. Replace `ami-12345678` in `main.tf` with a valid AMI ID from your AWS account.

## Usage

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Initialize Terraform

Run the following command to initialize Terraform and download required providers:

```bash
terraform init
```

### 3. Create Workspaces

Create separate workspaces for each environment (dev, qa, stage):

```bash
terraform workspace new dev
terraform workspace new qa
terraform workspace new stage
```

### 4. Select Workspace

Before applying the configuration, select the desired workspace:

```bash
terraform workspace select dev
```

### 5. Apply Configuration

Apply the Terraform configuration to create the EC2 instance for the selected workspace:

```bash
terraform apply
```

### 6. Verify the Workspace and Resources

You can verify the active workspace using:

```bash
terraform workspace show
```

Verify the created EC2 instance in the AWS Management Console.

## Customization

### Modify the Instance Type

The instance types for each workspace are defined in `main.tf`:

```hcl
variable "instance_types" {
  default = {
    dev   = "t2.micro"
    qa    = "t2.medium"
    stage = "t2.large"
  }
}
```

Update the map values to use different instance types if needed.

### Replace AMI ID

In the `main.tf` file, replace the placeholder `ami-12345678` with a valid AMI ID from your AWS region:

```hcl
module "ec2_instance" {
  source        = "./modules/ec2"
  ami           = "ami-12345678"
  instance_type = local.instance_type
  name          = "MyInstance-${terraform.workspace}"
}
```

## Project Components

### Root Module (`main.tf`)

The root module handles workspace-specific configurations and calls the EC2 module. It dynamically sets the instance type and other parameters based on the active workspace.

### EC2 Module (`modules/ec2`)

The EC2 module is a reusable component that creates an EC2 instance. It includes the following files:

- **main.tf**: Contains the resource definition for creating the EC2 instance.
- **variables.tf**: Defines the input variables for the module.

The module accepts the following variables:

- `ami`: The AMI ID for the instance.
- `instance_type`: The instance type (e.g., `t2.micro`).
- `name`: The name of the instance.

## Cleanup

To avoid incurring costs, destroy the resources:

```bash
terraform destroy
```

Delete the workspace if no longer needed:

```bash
terraform workspace select default
terraform workspace delete dev
terraform workspace delete qa
terraform workspace delete stage
```

## References

- [Terraform Workspaces](https://developer.hashicorp.com/terraform/docs/language/state/workspaces)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
