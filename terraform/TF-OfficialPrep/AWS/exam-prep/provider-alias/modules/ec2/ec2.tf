
resource "aws_instance" "firstec2" {
  ami           = var.east_ami
  instance_type = var.instance_flavor
  subnet_id     = var.first_subnet

  tags = {
    Name = var.firstec2
  }
}

resource "aws_instance" "secondec2" {
  ami           = var.west_ami
  instance_type = var.instance_flavor
  provider      = aws.west
  subnet_id     = var.second_subnet

  tags = {
    Name = var.secondec2
  }
}

output "first_ec2_out" {
    value = "aws_instance.firstec2.id"
}

output "second_ec2_out" {
    value = "aws_instance.secondec2.id"
}
