output "vpc_name" {
  value = "${aws_vpc.vpc.0.tags.Name}"
}
output "vpc_id" {
  value = "${aws_vpc.vpc.0.id}"
}
output "Public_instanceid" {
  value = "${aws_instance.public-instances.*.public_ip}"
}

