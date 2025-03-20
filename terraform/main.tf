resource "aws_instance" "geth_node" {
  ami           = "ami-04b4f1a9cf54c11d0" # Ubuntu 22.04 (Free Tier)
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              sudo usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "GethNode"
  }
}

output "public_ip" {
  value = aws_instance.geth_node.public_ip
}



