#1 VPC creation

resource "aws_vpc" "tf_vpc_a" {
  cidr_block = var.cidr


  tags = {
    Name = var.first_vpc_name
  }
}

resource "aws_vpc" "tf_vpc_b" {
  cidr_block = var.cidr
  provider   = aws.west
  tags = {
    Name = var.second_vpc_name
  }
}

output "first_vpc_out" {
    value = "aws_vpc.tf_vpc_a.id"
}

output "second_vpc_out" {
    value = "aws_vpc.tf_vpc_b.id"
}
