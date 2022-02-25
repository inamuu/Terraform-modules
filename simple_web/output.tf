output "instance_web" {
  value = aws_instance.web.id
}

output "eip_web" {
  value = aws_eip.web.id
}
