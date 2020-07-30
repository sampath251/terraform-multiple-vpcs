resource "aws_subnet" "public_subnets" {
  count = "${length(var.public_subnet_cidr)}"       # length is followed by cidr blocks
  vpc_id = "${aws_vpc.vpc.0.id}"           # resourcetype.logicalname.attribute, vpc lo count mention[0]
  cidr_block = "${element(var.public_subnet_cidr, count.index)}"  #element(list,index) function , list lo unna elements seq
 # availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "tcspub-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = "${length(var.private_subnet_cidr)}"       # length is followed by cidr blocks
  vpc_id            = "${aws_vpc.vpc.0.id}"           # resourcetype.logicalname.attribute
  cidr_block        = "${element(var.private_subnet_cidr, count.index)}"  #element(list,index) function , list lo unna elements seq
 # availability_zone = "${element(var.azs,count.index)}"

  tags = {
    Name = "tcspre-${count.index + 1}"
  }
}