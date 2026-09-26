provider "local" {}

resource "local_file" "hello" {
  filename = "${path.module}/${var.output_file}"
  content  = var.message
}
