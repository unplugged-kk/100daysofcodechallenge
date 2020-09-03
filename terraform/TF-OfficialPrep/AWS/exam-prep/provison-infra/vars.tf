variable "ami_name" {
  type    = string
  default = "ami-0761dd91277e34178"
}

variable "instance_flavor" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type    = string
  default = "aws01"
}

variable "ingressrules" {
  type    = list(number)
  default = [22, 80]
}

variable "egressrules" {
  type    = list(number)
  default = [22, 80]
}
