#4 Create  Custom Route table

resource "aws_route_table" "tf_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.rtb_cidr_ipv4
    gateway_id = var.igw_id
  }

  route {
    ipv6_cidr_block = var.rtb_cidr_ipv6
    gateway_id      = var.igw_id
  }

  tags = {
    Name = var.rtb_name
  }
}


# ROUTETABLE OUTPUT


output "out_rtb_id" {
  value = aws_route_table.tf_rtb.id
}

