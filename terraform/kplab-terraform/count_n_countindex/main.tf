provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.micro"
    count = 3

    tags = {
    Name = var.ec2_name[count.index]
  }
}

variable "ec2_name" {
    type = list
    default = ["test-ec2", "dev-ec2", "prod-ec2"]
}