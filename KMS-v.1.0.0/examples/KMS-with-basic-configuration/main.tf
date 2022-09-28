module "tagsmap" {
  source                = "../../tagsmap/"
  application_name      = "DEMO APP"
  application_code      = "FDS"
  application_owner     = "troy.lillehoff@wu.com"
  aws_region            = "us-east-1"
  business_unit         = "WesternUnion"
  cost_center           = "1390"
  domain                = "Foundation"
  environment           = "DEV"
  patch_group           = "Foundation"
  product_tower         = "Foundation"
  production_level_code = "Development"
  request_id            = "LZ"
  security_posture      = "NON PCI"
  support_contact       = "ioc_ccoe@wu.com"
}


module "kms" {
    source   = "../../"
    name = "alias/Test-KMS-Key"
    key_usage = "ENCRYPT_DECRYPT"
    customer_master_key_spec = "SYMMETRIC_DEFAULT"
    common_tags      = module.tagsmap.common_tags
    description      = "Test-KMS-Key"
    deletion_window_in_days = 8
    is_enabled = true
    enable_key_rotation = false
    multi_region = false
}