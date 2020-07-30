resource "aws_route_table" "terraform-public" {
  vpc_id = "${aws_vpc.vpc.0.id}"              

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"    # here attached igw
  }

  tags = {
    Name = "${var.public_Routing_Table}"
  }
}

resource "aws_route_table_association" "terraform-public" {
  count = "${length(var.public_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.public_subnets.*.id,count.index)}"    
    #splate syntex <resourcename>.<logicalresoname>.id
  route_table_id = "${aws_route_table.terraform-public.id}"
}

