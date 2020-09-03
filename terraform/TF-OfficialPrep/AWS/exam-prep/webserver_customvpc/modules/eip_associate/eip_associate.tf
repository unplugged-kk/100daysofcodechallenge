resource "aws_eip_association" "tf_eip_assoc" {
  instance_id   = var.instance_id
  allocation_id = var.eip_id

  depends_on    = [var.eip_association_depends_on]
}

