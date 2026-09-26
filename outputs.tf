output "created_file_path" {
  description = "Path to the file managed by Terraform."
  value       = local_file.hello.filename
}

output "file_content" {
  description = "Content written to the generated file ${var.output_file}."
  value       = local_file.hello.content
}
