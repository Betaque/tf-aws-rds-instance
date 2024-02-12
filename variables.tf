variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "subnet_ids" {
  description = "The VPC Subnet ID's to launch RDS Instances"
  type = list(string)
}

variable "rds_instance_security_group_name" {
  description = "Name of security group for RDS."
  type        = string
}

variable "rds_instance_security_group_tag_name" {
  description = "Tag of security group for RDS."
  type        = string
}

variable "rds_instance_ingress_rules" {
  description = "Ingress rules of security group for RDS."
  type        = list(any)
}

variable "rds_instance_ingress_cidr_blocks" {
  description = "Ingress CIDR Blocks of security group for RDS."
  type        = list(any)
}

variable "rds_instance_ingress_rules_from_port" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(any)
}

variable "rds_instance_ingress_rules_to_port" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(any)
}

variable "rds_instance_ingress_rules_protocols" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(any)
}

variable "rds_instance_egress_rules" {
  description = "Egress rules of security group for RDS."
  type        = list(any)
}

variable "rds_instance_egress_cidr_blocks" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(any)
}

variable "rds_instance_egress_rules_from_port" {
  description = "Egress rules from port of security group for RDS."
  type        = list(any)
}

variable "rds_instance_egress_rules_to_port" {
  description = "Egress rules to port of security group for RDS."
  type        = list(any)
}

variable "rds_instance_egress_rules_protocols" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(any)
}

variable "ingress_rule_database_port" {
  description = "Ingress rule port for RDS cluster."
  type        = number
}

variable "ingress_rule_port_protocol" {
  description = "Ingress rule protocol for RDS cluster."
  type        = string
}

variable "rds_instance_db_instance_identifier" {
  type        = string
  description = "A unique identifier for the DB instance"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage in gibibytes to allocate to the DB instance"
}

variable "storage_type" {
  type        = string
  description = "The storage type for the DB instance. Example values: 'gp2', 'io1', 'standard'"
}

variable "engine" {
  type        = string
  description = "The name of the database engine to be used for the DB instance"
}

variable "engine_version" {
  type        = string
  description = "The version number of the database engine to be used"
}

variable "instance_class" {
  type        = string
  description = "The compute and memory capacity of the DB instance"
}

variable "db_username" {
  type        = string
  description = "The master username for the DB instance"
}

variable "db_password" {
  type        = string
  description = "The master password for the DB instance"
}

variable "backup_retention_period" {
  type        = number
  description = "The number of days to retain automatic backups"
}

variable "maintenance_window" {
  type        = string
  description = "The window during which maintenance can occur on the DB instance"
}

variable "backup_window" {
  type        = string
  description = "The daily time range during which automated backups are created"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before deleting the DB instance"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name to use for the final DB snapshot when skip_final_snapshot is true"
}

variable "monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Specifies whether Performance Insights is enabled or not"
}

variable "aws_rds_instance_subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group for the RDS instance"
}

variable "db_subnet_group_tag_name" {
  type        = string
  description = "Name tag for the DB subnet group"
}


