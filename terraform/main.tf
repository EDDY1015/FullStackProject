resource "aws_instance" "geth_node" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Ubuntu 24.04 LTS
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "GethNode"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install -y docker.io",
      "sudo usermod -aG docker ubuntu"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.geth_node.public_ip
}
