#EC2 instance creation 

resource "aws_instance" "myec2" {
  key_name               = var.ec2_key_name
  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  availability_zone      = var.ec2_az
  subnet_id              = var.ec2_sub_id
  vpc_security_group_ids = ["${var.ec2_sg_id}"]
  tags = {
    name = var.ec2_name
  }
  depends_on                = [var.ec2_depends_on]

  user_data = <<-EOF
                #!/bin/bash
                sudo amazon-linux-extras enable nginx1.12
                sudo yum -y install nginx
                sudo service nginx start
                sudo service nginx status
                EOF
  
}
#output

output "out_ec2_id" {
  value = aws_instance.myec2.id
}


output "out_ec2_pip" {
    value = aws_instance.myec2.private_ip
}

output "out_ec2_eip" {
    value = aws_instance.myec2.public_ip
}

