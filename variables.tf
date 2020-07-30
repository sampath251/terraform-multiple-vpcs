variable "aws_region" {
    description = "aws regions list"
    type = "list"
    default = [ "us-east-1","us-east-2"]
}
variable "vpc_cidr" {
    default = ["192.168.0.0/16","10.10.0.0/16"]
}
variable "ami" {
    description = "ami for different regions list"
    type = "map"
    default = {
    us-east-1 = "ami-0ac80df6eff0e70b5" # ubuntu 14.04 LTS
		us-east-2 = "ami-f63b1193" # ubuntu 14.04 LTS
		us-west-1 = "ami-824c4ee2" # ubuntu 14.04 LTS
		us-west-2 = "ami-f2d3638a" # ubuntu 14.04 LTS
    }

}

variable "public_subnet_cidr" {
    description = "public subnets list"
    type = "list"
    default = [ "192.168.1.0/24","192.168.2.0/24", "192.168.3.0/24"]
}
variable "private_subnet_cidr" {
    description = "private subnets list"
    type = "list"
    default = [ "192.168.10.0/24","192.168.20.0/24", "192.168.30.0/24"]
}
 variable "public_Routing_Table"{}
# #variable "private_Routing_Table"{}
 variable "IGW_name" {}



