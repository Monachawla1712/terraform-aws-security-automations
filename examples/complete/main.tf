locals {
  region      = "us-east-1"
  environment = "prod"
  name        = "skaf"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  check_level = "" ## enter cis check level level-1 or level-2 or soc2 for ahieving desired compliance
}

module "cis" {

  source = "../../"

  name                                = local.name
  region                              = local.region
  email                               = "skaf-demo@squareops.com"
  cron_expression                     = "cron(0 22 1,10,20,28 * ? 2023)"
  check_level                         = local.check_level
  s3_enabled                          = true
  config_enabled                      = true
  include_global_resource_types       = true
  cw_log_enabled                      = true
  alerting_enabled                    = true
  multiple_access_key_notification    = true
  multiple_access_key_deactivate      = false
  disable_unused_cred_90_days         = false
  notify_unused_cred_90_days          = true
  notify_unused_cred_45_days          = true
  disable_unused_cred_45_days         = false
  remove_ssl_tls_iam                  = false
  enable_guard_duty                   = true
  enable_security_hub                 = true
  mfa_iam_group_name                  = "mfa-group"                                                                   ## enter your user group name
  cloudwatch_logs_kms_key_arn         = "" ## enter kms key id for encrypting cloudwatch log group of cloud trail
  cloudwatch_log_group_retention_days = 60
}
