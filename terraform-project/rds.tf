module "rds_mysql" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.9.0"

  identifier           = "${local.name_prefix}-terre-ahl-db"
  db_name              = var.db_name
  engine               = "mysql"
  family               = "mysql8.0"
  engine_version       = "8.0"
  major_engine_version = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  username             = var.username
  password             = var.password
  monitoring_interval  = 60
  db_subnet_group_name = aws_db_subnet_group.default.name

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  enabled_cloudwatch_logs_exports = ["error", "slowquery", "general"]

  iam_database_authentication_enabled = true

  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn

  tags = local.common_tags

  skip_final_snapshot = var.isdev
}
