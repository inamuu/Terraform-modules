output "instance_web" {
  value = aws_instance.web
}

output "eip_web" {
  value = aws_eip.web
}

output "sg_web" {
  value = aws_security_group.web
}
