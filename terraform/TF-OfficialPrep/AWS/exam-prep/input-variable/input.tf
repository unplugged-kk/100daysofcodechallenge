
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = var.flavors[var.region]
}
