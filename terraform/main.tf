resource "aws_instance" "geth_node" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 22.04 (Free Tier)
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
    private_key = file("${path.module}/my-key.pem") 
    host        = self.public_ip
  }
}

output "public_ip" {
  value = aws_instance.geth_node.public_ip
}
