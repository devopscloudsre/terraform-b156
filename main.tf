provider "local" {}

resource "local_file" "hello2" {
  filename = "${path.module}/${var.output_file}"
  content  = var.message
}


