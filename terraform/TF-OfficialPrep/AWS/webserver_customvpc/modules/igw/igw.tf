#3 Create internet Gateway

resource "aws_internet_gateway" "tf_gw" {
  vpc_id = var.vpc_id
}

# GATEWAY OUTPUT

output "out_igw_id" {
  value = aws_internet_gateway.tf_gw.id
}

output "out_igw" {
  value = aws_internet_gateway.tf_gw
}