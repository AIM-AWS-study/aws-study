# DB Instance
resource "aws_db_instance" "this" {
  identifier              = var.config.identifier
  instance_class          = var.config.instance_class
  engine                  = var.config.engine
  engine_version          = var.config.engine_version
  username                = var.config.username
  password                = var.config.password
  db_name                 = var.config.db_name
  allocated_storage       = var.config.allocated_storage
  skip_final_snapshot     = var.config.skip_final_snapshot
  publicly_accessible     = var.config.publicly_accessible
  vpc_security_group_ids  = var.config.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  parameter_group_name    = aws_db_parameter_group.this.name
  depends_on              = [aws_db_subnet_group.db_subnet_group, aws_db_parameter_group.this]
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.config.identifier}-subnet-group"
  subnet_ids = var.config.subnet_ids

  tags = {
    Name = "${var.config.identifier}-subnet-group"
  }
}

resource "aws_db_parameter_group" "this" {
  name       = "${var.config.identifier}-parameter-group"
  family     = var.config.family
  dynamic "parameter" {
    for_each = var.config.parameters
    content {
      name = parameter.key
      value = parameter.value
    }
  }
}
    