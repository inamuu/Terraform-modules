output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public-subnets" {
  value = {
    0 = aws_subnet.public_1a.id,
    1 = aws_subnet.public_1c.id
  }
}

output "private-subnets" {
  value = {
    0 = aws_subnet.private_1a,
    1 = aws_subnet.private_1c,
  }
}
