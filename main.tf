provider "aws" {
   region = "${var.aws_region[0]}"
}
resource "aws_vpc" "vpc"{
    count = 1
    cidr_block = "${element(var.vpc_cidr,count.index)}"
    enable_dns_hostnames = true
    tags = {
        Name =  "TCSVPC-${count.index + 1}" 
        owner = "sampath"
        envir = "development"
    }
}

