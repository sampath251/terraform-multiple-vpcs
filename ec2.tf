resource "aws_instance" "public-instances" {
  #ami = "${data.aws_ami.my_ami.id}"
  count = 2
  ami   = "${lookup(var.ami, var.aws_region.0)}" #ubunut
  #availability_zone = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = "devops"
  subnet_id                   = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  #user_data=file("${path.module}/hello.txt")
  user_data = "${file("script.sh")}"
#   user_data = <<-EOF
#                 #!/bin/bash
#                 sudo apt-get update
# 		        sudo apt-get install -y nginx unzip
#                 sudo chkconfig nginx on
#                 echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
#     EOF	
  tags = {
    Name  = "PublicServer-${count.index + 1}"
    Env   = "Prod"
    Owner = "Sampath"
    # CostCenter = "ABCD"
  }
}


# resource "aws_instance" "private-instances" {
#     #ami = "${data.aws_ami.my_ami.id}"
#     count = 2
#     ami = "ami-0ac80df6eff0e70b5"
#     #availability_zone = "us-east-1a"
#     instance_type = "t2.nano"
#     key_name = "LaptopKey"
#     subnet_id = "${element(aws_subnet.private-subnets.*.id, count.index)}"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_public_ip_address = true
#     user_data = <<-EOF
#     #!/bin/bash
#     sudo apt-get update
#     sudo apt-get install -y nginx unzip
#     echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
#     EOF
#     tags = {
#         Name = "PrivateServer-${count.index+1}"
#     #     Env = "Prod"
#     #     Owner = "Sree"
# 	# CostCenter = "ABCD"
#     }
# }
