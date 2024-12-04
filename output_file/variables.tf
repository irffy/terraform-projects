variable "file_name" {
  description = "Name of the file to be created"
  type        = string
  default     = "example.txt"
}

variable "file_content" {
  description = "Content to write to the file"
  type        = string
  default     = "Hello Irfan, this is a sample file created using Terraform."
}