resource "aws_instance" "myec2" {
  ami= "ami-09d8b5222f2b93bf0"
  instance_type = var.ec2type
}

