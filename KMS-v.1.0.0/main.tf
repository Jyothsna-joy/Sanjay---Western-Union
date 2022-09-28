resource "aws_kms_alias" "test-KMS-key" {
  name          = var.name
  target_key_id = aws_kms_key.test-KMS-key.key_id
  name_prefix   = var.name_prefix
}


resource "aws_kms_key" "test-KMS-key" {
  description                        = var.description
  key_usage                          = var.key_usage
  customer_master_key_spec           = var.customer_master_key_spec
  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.deletion_window_in_days
  is_enabled                         = var.is_enabled
  enable_key_rotation                = var.enable_key_rotation
  multi_region                       = var.multi_region



  tags = merge(
    var.common_tags,
    var.additional_tags,
    tomap({
      "description" : var.description
    })
  )


}


# resource "aws_kms_external_key" "test-kms-external-key" { 
#     bypass_policy_lockout_safety_check =  var.bypass_policy_lockout_safety_check
#     deletion_window_in_days = var.deletion_window_in_days
#     description =  var.description
#     enabled = var.enabled
#     key_material_base64 = var.key_material_base64
#     multi_region = var.multi_region
#     policy = var.policy
#     valid_to = var.valid_to

# }