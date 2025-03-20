resource "aws_instance" "geth_node_test" {
  ami           = "ami-04b4f1a9cf54c11d0" # Ubuntu 22.04 (Free Tier)
  instance_type = var.instance_type
  key_name      = var.key_name


  tags = {
    Name = "GethNode"
  }
}

output "public_ip" {
  value = aws_instance.geth_node.public_ip
}



