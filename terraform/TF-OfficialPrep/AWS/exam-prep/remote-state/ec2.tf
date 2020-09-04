terraform {
  backend "s3" {
    bucket = "tfbackend69"
    key    = "remote-tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0761dd91277e34178"
  instance_type = "t2.micro"
}
