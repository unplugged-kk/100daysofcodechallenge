provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "dev" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.micro"
    count = var.istest == true ? 1 : 0
    tags = {
    Name = "syler-dev-ec2"
  }
}

resource "aws_instance" "prod" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.large"
    count = var.istest == false ? 1 : 0
    tags = {
    Name = "syler-prod-ec2"
  }
}

variable "istest" {
}