variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-0761dd91277e34178"
    "us-west-1" = "ami-0ec0b3eb271f5afbc"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "flavors" {
  type = map(string)
  default = {
    "us-east-1" = "t3.micro"
    "us-west-2" = "t2.micro"
  }
}
