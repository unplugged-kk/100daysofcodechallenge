provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "app-dev" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_instance" "db-dev" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.micro"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
availability_zone = "us-east-1a"
size = 10
tags = local.common_tags
}

locals {
  common_tags = {
  Owner = "Devops Team"
  service = "backend"
  }
}