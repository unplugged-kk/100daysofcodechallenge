variable "vpc_id" {
    type = string
}

variable "rtb_name" {
    type = string
}

variable "rtb_cidr_ipv4" {
    type = string
    default = "0.0.0.0/0"
}

variable "rtb_cidr_ipv6" {
    type = string
    default = "::/0"
}

variable "igw_id" {
    type = string
}
