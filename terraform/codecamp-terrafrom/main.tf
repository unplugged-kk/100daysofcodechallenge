provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAY6NQTFFT7KLT4C4V"
  secret_key = "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"
}

# vpc
resource "aws_vpc" "syler-vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "syler-prod"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id     = "${aws_vpc.syler-vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "syler-prod-subnet"
  }
}

#aws_instance

resource "aws_instance" "syler-tf" {
  ami           = "ami-0ac80df6eff0e70b5"
  instance_type = "t2.micro"

}
