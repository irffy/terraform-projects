resource "local_file" "example" {
  filename = var.file_name
  content  = var.file_content
}