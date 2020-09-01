
#1 VPC creation

resource "aws_vpc" "tf_vpc_a" {
  cidr_block = "10.0.0.0/16"


  tags = {
    Name = "Terraform VPC 1"
  }
}

resource "aws_vpc" "tf_vpc_b" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.west
  tags = {
    Name = "Terraform VPC 2"
  }
}

#2 Create a subnet

resource "aws_subnet" "tf_sub_a" {
  vpc_id            = aws_vpc.tf_vpc_a.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-a"
  }
}


resource "aws_subnet" "tf_sub_b" {
  vpc_id            = aws_vpc.tf_vpc_b.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name = "subnet-b"
  }
}



resource "aws_instance" "firstec2" {
  ami           = var.east_ami
  instance_type = var.instance_flavor
  subnet_id     = aws_subnet.tf_sub_a.id

  tags = {
    Name = "HelloWorld1"
  }
}

resource "aws_instance" "secondec2" {
  ami           = var.west_ami
  instance_type = var.instance_flavor
  provider      = aws.west
  subnet_id     = aws_subnet.tf_sub_b.id

  tags = {
    Name = "HelloWorld2"
  }
}
