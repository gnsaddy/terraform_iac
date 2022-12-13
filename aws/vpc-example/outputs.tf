# output for the VPC ID
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# output for the public subnet ID
output "public_subnet_id" {
  value = aws_subnet.public_subnet.*.id
}

# output for the private subnet ID
output "private_subnet_id" {
  value = aws_subnet.private_subnet.*.id
}

# output for the public subnet CIDR block
output "public_subnet_cidr" {
  value = aws_subnet.public_subnet.*.cidr_block
}

# output for the private subnet CIDR block
output "private_subnet_cidr" {
  value = aws_subnet.private_subnet.*.cidr_block
}

# output for the public subnet availability zone
output "public_subnet_availability_zone" {
  value = aws_subnet.public_subnet.*.availability_zone
}

# output for the private subnet availability zone
output "private_subnet_availability_zone" {
  value = aws_subnet.private_subnet.*.availability_zone
}

# output for the public subnet availability zone ID
output "public_subnet_availability_zone_id" {
  value = aws_subnet.public_subnet.*.availability_zone_id
}

# output for the private subnet availability zone ID
output "private_subnet_availability_zone_id" {
  value = aws_subnet.private_subnet.*.availability_zone_id
}

