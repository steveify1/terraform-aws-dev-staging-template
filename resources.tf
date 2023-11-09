// AWS security group resource for backend node
resource "aws_security_group" "backend_node_sg" {
  name        = "backend_node_sg"
  description = "Allow SSH traffic from all IP addresses"

  // VPC ID where you want to create the security group
  vpc_id = var.vpc_id

  // Inbound SSH rule from all IP addresses
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound traffic by default"
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
  }

}

output "backend_node_sg_id" {
  value = aws_security_group.backend_node_sg.id
}

resource "aws_instance" "backend_node" {
  ami           = var.ami_map.backend_node.ami_id
  instance_type = var.instance_type_map.backend_node
  key_name      = var.keypair_web2
  tags = {
    Name = "backend_node"
  }
  subnet_id       = var.public_subnet_id
  security_groups = [aws_security_group.backend_node_sg.id]
  user_data       = file("init.sh")
}
