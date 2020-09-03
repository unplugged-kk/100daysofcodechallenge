#7  SG creation

resource "aws_security_group" "tf_sg" {
  name        = "allow_ssh_http_https"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = var.sg_protocol
    cidr_blocks = var.ingress_cidr
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = var.sg_protocol
    cidr_blocks = var.egress_cidr
    }
  }

  tags = {
    Name = var.sg_name
  }
}

# SG OUTPUT

output "out_sg_id" {
  value = aws_security_group.tf_sg.id
}

