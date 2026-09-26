output "created_file_path" {
  description = "Path to the file managed by Terraform."
  value       = local_file.hello2.filename
}

output "file_content" {
  description = "Content written to the generated file"
  value       = local_file.hello2.content
}
