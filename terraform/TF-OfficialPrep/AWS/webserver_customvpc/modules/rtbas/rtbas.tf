
#5. Associate Route table 

resource "aws_route_table_association" "tf_rtbas" {
  subnet_id      = var.sub_id
  route_table_id = var.rtb_id
}

output "out_rtbas_id" {
  value = aws_route_table_association.tf_rtbas.id
}