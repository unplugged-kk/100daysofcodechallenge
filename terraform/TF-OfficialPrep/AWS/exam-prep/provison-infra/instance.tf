resource "aws_key_pair" "example" {
  key_name   = "examplekey"
  public_key = file("~/.ssh/terraform.pub")

}

resource "aws_instance" "firstec2" {
  ami             = var.ami_name
  instance_type   = var.instance_flavor
  key_name        = aws_key_pair.example.key_name
  security_groups = [aws_security_group.allow_connect.name]
  tags = {
    Name = var.instance_name
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/terraform")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1.12",
      "sudo yum -y install nginx",
      "sudo service nginx start",
      "sudo service nginx status"
    ]
  }
}


