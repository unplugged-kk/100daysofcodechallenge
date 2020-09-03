resource "aws_eip" "tf_eip" {
    vpc                       = var.eip_vpc

    tags = {
        Name = var.eip_name
    }
}

output "out_eip_id" {
    value = aws_eip.tf_eip.id
}

output "out_eip_id_pub" {
    value = aws_eip.tf_eip.public_ip
}