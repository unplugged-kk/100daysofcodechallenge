variable "cidr" {
    type = string
    default = "10.0.0.0/24"
}

variable "first_vpc_name" {
    type = string
    default = "terraform-east"
}

variable "second_vpc_name" {
    type = string
    default = "terraform-west"
}

