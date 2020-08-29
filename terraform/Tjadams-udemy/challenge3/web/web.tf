resource "aws_instance" "web" {
  ami           = "ami-09d8b5222f2b93bf0"
  instance_type = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data = file("./web/server-script.sh")

  tags = {
    Name = "Web server"
  }
}

output "pub_ip" {
    value = module.eip.PublicIP
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg"
}

