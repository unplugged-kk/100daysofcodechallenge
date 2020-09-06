variable "vpc_a" {
    type = string
    default = " "
}
variable "vpc_b" {
    type = string
    default = " "
}

variable "cidr_a" {
    type = string
    default = "10.0.1.0/24 "
}

variable "cidr_b" {
    type = string
    default = "10.0.2.0/24"
}

variable "first_subnet" {
    type = string
    default = "tf-first-sub"
}

variable "second_subnet" {
    type = string
    default = "tf-second-sub"
}

variable "vpc_a_az" {
    type = string
    default = "us-east-1a"
}

variable "vpc_b_az" {
    type = string
    default = "us-west-1b"
}



