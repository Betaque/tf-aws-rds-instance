# RDS Instance Module

This module creates a RDS Instance in AWS with customizable configurations.

## Usage

1. **Get Started:** Begin by creating the necessary files, provider.tf and main.tf, in your Terraform project directory.
2. **Declare Provider:** Open provider.tf and declare the AWS provider. Ensure you've configured your AWS credentials and set the desired region.
```
provider "aws" {
  region = "us-east-1" // Set your AWS region
}
```
3. **Add RDS Module and Define Variables:** Incorporate the RDS Module into your main.tf file, and set values for the variables defined in variables.tf.

For Example:-
```
module "rds_instance" {
  source                                                 = "git::https://github.com/Betaque/tf-aws-rds-instance.git//?ref=feat/generic-rds" # Path of the Module

  vpc_id                                                 = module.vpc_module.vpc_id
  rds_security_group_name                                = "mysql-sg-east1"
  rds_security_group_tag_name                            = "rds test security group"
  rds_ingress_rules                                      = [3306]
  rds_ingress_cidr_blocks                                = ["0.0.0.0/0"]
  rds_ingress_rules_from_port                            = [3306]
  rds_ingress_rules_to_port                              = [3306]
  rds_ingress_rules_protocols                            = ["tcp"]
  rds_egress_rules                                       = [0]
  rds_egress_cidr_blocks                                 = ["0.0.0.0/0"]
  rds_egress_rules_from_port                             = [0]
  rds_egress_rules_to_port                               = [0]
  rds_egress_rules_protocols                             = ["-1"]
  ingress_rule_database_port                             = 3306
  ingress_rule_port_protocol                             = "tcp"
  public_subnet_id                                       = module.vpc_module.public_subnet_id
  private_lambda_subnet_id                               = module.vpc_module.private_subnet_id
  db_instance_identifier                                 = "test-db"
  allocated_storage                                      = 20
  storage_type                                           = "gp2"
  engine                                                 = "mysql"
  engine_version                                         = "5.7" 
  instance_class                                         = "db.t3.medium"
  db_username                                            = "dbuser"
  db_password                                            = "dbpassword"
  backup_retention_period                                = 7
  backup_window                                          = "03:00-04:00"
  maintenance_window                                     = "mon:04:00-mon:04:30"
  skip_final_snapshot                                    = false
  final_snapshot_identifier                              = "test-db"
  monitoring_interval                                    = 60
  performance_insights_enabled                           = true
  db_subnet_group_name                                   = "test-subnet-group"
  db_subnet_group_tag_name                               = "test-subnet-group"
}
```

4. **Initialize Terraform:** Run the below terraform Command to initialize the project and download the module dependencies.
```
terraform init
```

5. **Apply Changes:** Execute the below terraform Command to create the VPC infrastructure based on the specified configurations.
```
terraform apply
``` 
