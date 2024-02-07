resource "aws_db_instance" "rds_instance" {
  identifier                 = var.rds_instance_db_instance_identifier
  allocated_storage          = var.allocated_storage
  storage_type               = var.storage_type
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  username                   = var.db_username
  password                   = var.db_password

  vpc_security_group_ids     = [aws_security_group.rds_instance_security_group.id]
  db_subnet_group_name       = aws_db_subnet_group.rds_instance_db_subnet_group.name

  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window

  skip_final_snapshot        = var.skip_final_snapshot
  final_snapshot_identifier  = var.final_snapshot_identifier

  # Enable enhanced monitoring
  monitoring_interval         = var.monitoring_interval # Interval in seconds (minimum 60 seconds)
  monitoring_role_arn         = aws_iam_role.rds_instance_monitoring_role.arn

  # Enable performance insights
  performance_insights_enabled = var.performance_insights_enabled
}

