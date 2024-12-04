output "created_file_name" {
  description = "The name of the created file"
  value       = local_file.example.filename
}

output "file_content" {
  description = "The content of the created file"
  value       = var.file_content
}