variable "message" {
  description = "Text content to write to the generated file."
  type        = string
  default     = "Hello from Terraform!"
}

variable "output_file" {
  description = "Name of the file Terraform will create in this directory."
  type        = string
  default     = "hello.txt"

  validation {
    condition     = can(regex("^[A-Za-z0-9._-]+$", var.output_file))
    error_message = "output_file must be a simple filename using letters, numbers, dots, underscores, or hyphens."
  }
}
