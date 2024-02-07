data "aws_iam_policy" "rds_instance_monitoring_policy" {
  name = "AmazonRDSEnhancedMonitoringRole"
}

resource "aws_iam_role" "rds_instance_monitoring_role" {
  name                  = "rdsMonitoringRole"
  path                  = "/"
  assume_role_policy    = file("${path.module}/rds_instance_monitoring_role.json")
  force_detach_policies = false
  managed_policy_arns   = [data.aws_iam_policy.rds_instance_monitoring_policy.arn]
}
