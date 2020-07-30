# resource "aws_internet_gateway" "default" {
#   vpc_id = "${aws_vpc.default.id}"
#   tags = {
#     Name = "${var.IGW_name}"
#   }
# }
# resource "aws_eip" "eipnatgw"{
#  vpc = "true"      #creating eip for nat
# }

# resource "aws_nat_gateway" "natgw"{
#   allocation_id = "${aws_eip.eipnatgw.id}"
#   subnet_id = "${aws_subnet.public_subnets.0.id}"
# }