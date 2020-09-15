provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = var.types["us-east-1b"]
}

variable "list" {
    type = list
    default = [ "m5.large","m5.xlarge","t2.medium"]
}

variable "types" {
    type = map
    default = {
        us-east-1a = "t2.micro"
        us-east-1b = "t2.nano"
        us-east-1c = "t2.small"
    }
}