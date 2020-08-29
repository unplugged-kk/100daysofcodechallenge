provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  user_data = file("server-script.sh")

  tags = {
    Name = "web server"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web.id
}

variable "ingressrules" {
    type = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type = list(number)
    default = [80, 443]
}

resource "aws_security_group" "web_traffic" {
  name        = "allow_web_traffic"
  description = "Allow web traffic"
  

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "web_traffic"
  }
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.eip.PublicIP
}

