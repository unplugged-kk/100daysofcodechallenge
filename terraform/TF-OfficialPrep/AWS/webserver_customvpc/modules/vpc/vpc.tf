#1 VPC creation

resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = var.vpc_name
  }
}

# VPC OPTPUT 

output "out_vpc_id" {
  value = aws_vpc.tf_vpc.id
}



