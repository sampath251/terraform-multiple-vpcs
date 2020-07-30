# resource "aws_route_table" "terraform-private" {
#   vpc_id = "${aws_vpc.default.id}"

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "${aws_nat_gateway.natgw.id}"    #here attaching nat gw
#   }

#   tags = {
#     Name = "${var.private_Routing_Table}"
#   }
# }

# resource "aws_route_table_association" "terraform-private" {
#   count = "${lenght(var.private_subnet_cidr)}"
#   subnet_id      = "${element(aws_subnet.private_subnets.*.id,count.index)}"            #attributes
#   route_table_id = "${aws_route_table.terraform-private.id}"
# }