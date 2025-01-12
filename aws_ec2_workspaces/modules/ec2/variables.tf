# modules/ec2/variables.tf
variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "name" {
  description = "The name of the instance"
  type        = string
}
