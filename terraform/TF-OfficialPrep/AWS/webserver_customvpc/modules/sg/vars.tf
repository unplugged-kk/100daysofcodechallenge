variable "ingressrules" {
    type = list(number)
    default = [80,22,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,22,443]
}

variable "vpc_id" {
    type = string
}

variable "sg_name" {
    type = string
}

variable "sg_protocol" {
    type = string
    default = "tcp"
}

variable "ingress_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "egress_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}


