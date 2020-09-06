#2 Create a subnet

resource "aws_subnet" "tf_sub_a" {
  vpc_id            = var.vpc_a
  cidr_block        = var.cidr_a
  availability_zone = var.vpc_a_az

  tags = {
    Name = vpc.first_subnet
  }
}


resource "aws_subnet" "tf_sub_b" {
  vpc_id            = var.vpc_b
  cidr_block        = var.cidr_b
  availability_zone = var.vpc_b_az

  tags = {
    Name = var.second_subnet
  }
}

output "first_sub_out" {
    value = "aws_subnet.tf_sub_a.id"
}

output "second_sub_out" {
    value = "aws_subnet.tf_sub_b.id"
}
