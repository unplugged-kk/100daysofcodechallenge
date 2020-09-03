
variable "vpc_cidr" {
    type = string
}

variable "vpc_tenancy" {
    type    = string
    default = "default"
}

variable "vpc_name" {
    type = string
}