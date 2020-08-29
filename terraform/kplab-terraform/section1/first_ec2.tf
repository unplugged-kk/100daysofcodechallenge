provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAREHHM4R7NRWKJQFX"
  secret_key = "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"
}


resource "aws_instance" "myec2" {
  ami= "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"
}

