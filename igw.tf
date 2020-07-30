resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.0.id}"

  tags = {
    Name = "${var.IGW_name}"
  }
}