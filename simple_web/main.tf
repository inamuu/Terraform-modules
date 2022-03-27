resource "aws_instance" "web" {
  ami                     = var.ami
  count                   = var.instance_count
  disable_api_termination = false
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = lookup(var.public-subnets, count.index % 2)
  vpc_security_group_ids  = [aws_security_group.web.id]

  root_block_device {
    volume_type = "gp2"
    volume_size = var.volume_size
    tags = {
      "Snapshot" : var.snapshot_status
    }
  }
}

resource "aws_eip" "web" {
  count    = 1
  instance = element(aws_instance.web.*.id, count.index)
  vpc      = true
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "web"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
