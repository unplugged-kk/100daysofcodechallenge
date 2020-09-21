variable "project" {
    type = string
    default = "automation-extended-infra"
}

variable "region" {
    type = string
    default = "asia-east1"
}

variable "zone" {
    type = string
    default = "asia-east1-a"
}

variable "network" {
    type = string
    default = "default"
}

variable "subnetwork" {
     type = string
     default = "" 
}

variable "cluster_name" {
    type = string
    default = "syler-cluster"
}

variable "ip_range_pods" {
     type = string
     default = "" 
}

variable "ip_range_services" {
     type = string
     default = "" 
}


variable "script_path" {
    type = string
    default = ""
}

variable "username" {
     type = string
     default = "" 
}

variable "private_key_path" {
     type = string
     default = "" 
}
