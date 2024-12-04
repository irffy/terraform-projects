provider "local" {
  # No configuration needed for the local provider
}

resource "local_file" "example" {
  filename = "example.txt"  # Name of the file to create
  content  = "Hello, Irfan!"  # Text to write to the file
}

output "file_path" {
  value = local_file.example.filename
}
