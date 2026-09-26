provider "local" {}

resource "local_file" "hello1" {
  filename = "${path.module}/${var.output_file}"
  content  = var.message
}


