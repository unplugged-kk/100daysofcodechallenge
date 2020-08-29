provider "aws" {
  region     = "us-east-1"  
}

resource "aws_instance" "ec2" {
    ami = "ami-09d8b5222f2b93bf0"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2.id
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port =  443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

        }

    }



output "eip" {
    value = aws_eip.elasticip.public_ip
}
