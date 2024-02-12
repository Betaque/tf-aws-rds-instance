# RDS Instance Module

This module creates a RDS Instance in AWS with customizable configurations.

### Prerequisites
- An AWS account.
- Terraform CLI installed on your local machine, you can check it, [How to Install Guideline here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### AWS Authentication 
This guide outlines the process of authenticating with AWS using Terraform through Access Key and Secret Key.

**Generate Access Key and Secret Key:**
1. Log in to your AWS Management Console.
2. Go to the IAM service.
3. Navigate to the Users section and select the user for whom you want to generate the access key and secret key.
4. Under the Security credentials tab, click on Create access key.
5. Make sure to save the access key ID and secret access key. These will be used for authentication.

### Module Configurations:
 
**1. Create a new Terraform configuration file (e.g., provider.tf) or use an existing one.**

**2. Add the following code to configure AWS provider with access key and secret key:**

```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region     = "us-west-2"  # Replace with your desired AWS region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
Replace **YOUR_ACCESS_KEY** and **YOUR_SECRET_KEY** with the access key ID and secret access key generated in the previous step.

or you can export your access_key and secret_key on your local machine.
```
export access_key="YOUR_ACCESS_KEY"
export secret_key="YOUR_SECRET_KEY"
```

**3. Add RDS Instance Module and Define Variables:**


Add the RDS Instance Module to your main.tf file and fill in the variables in variables.tf with the values you need. Just replace the example values with your own settings.

**For Example:-**

```
module "rds_instance" {
  source                                                 = "git::https://github.com/Betaque/tf-aws-rds-instance.git//?ref=feat/generic-rds" # Path of the Module
  vpc_id                                                 = <YOUR_VPC_ID>
  rds_instance_security_group_name                       = "mysql-sg-east1"
  rds_instance_security_group_tag_name                   = "rds test security group"
  rds_instance_ingress_rules                             = [3306]
  rds_instance_ingress_cidr_blocks                       = ["0.0.0.0/0"]
  rds_instance_ingress_rules_from_port                   = [3306]
  rds_instance_ingress_rules_to_port                     = [3306]
  rds_instance_ingress_rules_protocols                   = ["tcp"]
  rds_instance_egress_rules                              = [0]
  rds_instance_egress_cidr_blocks                        = ["0.0.0.0/0"]
  rds_instance_egress_rules_from_port                    = [0]
  rds_instance_egress_rules_to_port                      = [0]
  rds_instance_egress_rules_protocols                    = ["-1"]
  ingress_rule_database_port                             = 3306
  ingress_rule_port_protocol                             = "tcp"
  subnet_id                                              = ["<YOUR_SUBNET_ID_1>", "<YOUR_SUBNET_ID_2>"] #List of subnet IDs where the RDS instances will be launched,  You can also provide a single subnet ID.
  rds_instance_db_instance_identifier                    = "test-db"
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
  aws_rds_instance_subnet_group_name                     = "test-subnet-group"
  db_subnet_group_tag_name                               = "test-subnet-group"
}
```

**4. Initialize Terraform:** 

Open a terminal and navigate to the directory containing your Terraform configuration file.

Run the following command to initialize Terraform:
```
terraform init
```

**5. Apply Terraform Configuration:** 

After initializing, you can now apply the Terraform configuration to authenticate with AWS:
```
terraform apply
``` 
