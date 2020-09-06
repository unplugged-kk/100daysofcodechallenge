variable "east_ami" {
  type    = string
  default = "ami-0761dd91277e34178"
}
variable "west_ami" {
  type    = string
  default = "ami-0ec0b3eb271f5afbc"
}
variable "instance_flavor" {
  type    = string
  default = "t2.micro"
}
variable "firstec2" {
  type    = string
  default = "ec2-east"
}
variable "secondec2" {
  type    = string
  default = "ec2-west"
}

variable "first_subnet" {
  type    = string
  default = " "
}

variable "second_subnet" {
  type    = string
  default = " "
}