locals {

  is_acl_configuration_present = var.acl_configuration == null ? false : true
  acl_configuration            = local.is_acl_configuration_present ? [var.acl_configuration] : []

  is_encryption_configuration_present = var.encryption_configuration == null ? false : true
  encryption_configuration            = local.is_encryption_configuration_present ? [var.encryption_configuration] : []

  is_configuration_present = var.configuration == null ? false : true
  configuration            = local.is_configuration_present ? [var.configuration] : []




}




resource "aws_athena_database" "mydb" {
  bucket = var.bucket
  name   = var.name

  dynamic "acl_configuration" {
    for_each = local.acl_configuration
    content {
      s3_acl_option = acl_configuration.value.s3_acl_option
    }

  }

  expected_bucket_owner = var.expected_bucket_owner
  force_destroy         = var.force_destroy
  properties            = var.properties

  dynamic "encryption_configuration" {
    for_each = local.encryption_configuration
    content {
      kms_key           = lookup(encryption_configuration.value, "kms_key", null)
      encryption_option = encryption_configuration.value.encryption_option

    }

  }


}


resource "aws_athena_workgroup" "myworkgroup" {
  name          = var.work_group_name
  state         = var.state
  force_destroy = var.force_destroy



  dynamic "configuration" {
    for_each = local.configuration
    content {

      bytes_scanned_cutoff_per_query     = lookup(configuration.value, "bytes_scanned_cutoff_per_query", null)
      enforce_workgroup_configuration    = lookup(configuration.value, "enforce_workgroup_configuration", null)
      publish_cloudwatch_metrics_enabled = lookup(configuration.value, "publish_cloudwatch_metrics_enabled", null)
      requester_pays_enabled             = lookup(configuration.value, "requester_pays_enabled", null)

      dynamic "engine_version" {
        for_each = lookup(configuration.value, "engine_version", null) == null ? [] : [configuration.value.engine_version]
        content {
          selected_engine_version = lookup(engine_version.value, "selected_engine_version", null)
        }
      }


      dynamic "result_configuration" {
        for_each = lookup(configuration.value, "result_configuration", null) == null ? [] : [configuration.value.result_configuration]
        content {
          dynamic "encryption_configuration" {
            for_each = lookup(result_configuration.value, "encryption_configuration", null) == null ? [] : [result_configuration.value.encryption_configuration]
            content {
              encryption_option = result_configuration.value.encryption_option
              kms_key_arn       = lookup(encryption_configuration.value, "kms_key_arn", null)
            }
          }

          dynamic "acl_configuration" {
            for_each = lookup(result_configuration.value, "acl_configuration", null) == null ? [] : [result_configuration.value.acl_configuration]
            content {
              s3_acl_option = acl_configuration.value.s3_acl_option
            }
          }
          expected_bucket_owner = lookup(result_configuration.value, "expected_bucket_owner", null)
          output_location       = lookup(result_configuration.value, "output_location", null)

        }


      }

    }
  }


}

