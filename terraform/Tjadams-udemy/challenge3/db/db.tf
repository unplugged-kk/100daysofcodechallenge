resource "aws_instance" "db" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}

