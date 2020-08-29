
#6 EC2 KEY PAIR creation

resource "aws_key_pair" "ec2key" {
  key_name   = "tf_key"
  public_key = file("~/.ssh/terraform.pub")
}

output "out_tf_key_id" {
  value = aws_key_pair.ec2key.id
}
