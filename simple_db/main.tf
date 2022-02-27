resource "aws_security_group" "sg" {
  name        = "${var.project}-db"
  description = "${var.project} db"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "sg_rule" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = var.sg_web.id
  security_group_id        = aws_security_group.sg.id
}

resource "aws_db_subnet_group" "subnet_group" {
  name        = var.project
  description = "${var.project} subnet group"
  subnet_ids  = [var.private-subnets.0, var.private-subnets.1]
}

resource "aws_db_instance" "db" {
  identifier                 = var.project
  allocated_storage          = var.db_storage_size
  storage_type               = "gp2"
  engine                     = "mysql"
  engine_version             = var.db_engine_version
  instance_class             = var.db_instance_class
  db_name                    = var.db_name
  username                   = var.db_user
  password                   = var.db_password
  parameter_group_name       = var.db_parameter_group
  db_subnet_group_name       = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids     = [aws_security_group.sg.id]
  multi_az                   = false
  final_snapshot_identifier  = false
  skip_final_snapshot        = false
  backup_retention_period    = "14"
  backup_window              = "19:00-19:30"
  apply_immediately          = "true"
  auto_minor_version_upgrade = true
}
