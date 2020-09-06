
provider "aws" {
  region = var.region
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = var.flavors[var.region]
}
