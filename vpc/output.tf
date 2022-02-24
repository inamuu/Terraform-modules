output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_public_1a" {
  value = aws_subnet.public_1a.id
}

output "subnet_public_1c" {
  value = aws_subnet.public_1c.id
}

output "subnet_private_1a" {
  value = aws_subnet.private_1a.id
}

output "subnet_private_1c" {
  value = aws_subnet.private_1c.id
}
