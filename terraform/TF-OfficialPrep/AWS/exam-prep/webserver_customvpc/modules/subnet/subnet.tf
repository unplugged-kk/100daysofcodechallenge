#2 Create a subnet

resource "aws_subnet" "tf_sub" {
  vpc_id            = var.vpc_id
  cidr_block        = var.sub_cidr
  availability_zone = var.sub_az

  tags = {
    Name = var.sub_name
  }
}

# SUBNET OUTPUT

output "out_sub_id" {
  value = aws_subnet.tf_sub.id
}

