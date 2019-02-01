terraform {
  backend "atlas" {
    name    = "tforg123/tf_atlas_backend"
  }
}

resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}

