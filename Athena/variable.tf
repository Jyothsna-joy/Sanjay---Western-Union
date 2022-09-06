
variable "bucket" {
  type        = string
  description = "Name of S3 bucket to save the results of the query execution."
  default = "athena--test-bucket"
  
  validation {
    condition     = can(regex("^[a-z-]", var.bucket))
    error_message = "Bucket name should contain only lowercase letters?"
    
  }
}

variable "name" {
  type        = string
  description = "Name of the database to create."
}

variable "acl_configuration" {
  type        = object({})
  default     = null
  description = "Indicates that an Amazon S3 canned ACL should be set to control ownership of stored query results."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "he AWS account ID that you expect to be the owner of the Amazon S3 bucket."
}


variable "encryption_configuration" {
  type        = object({})
  default     = null
  description = "he encryption key block AWS Athena uses to decrypt the data in S3, such as an AWS Key Management Service (AWS KMS) key"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all tables should be deleted from the database so that the database can be destroyed without error. The tables are not recoverable."
}

variable "properties" {
  type        = map(string)
  default     = null
  description = " key-value map of custom metadata properties for the database definition."
}

variable "work_group_name" {
  type        = string
  description = "Name of the workgroup."
}

variable "configuration" {
  type    = object({})
  default = null
}

variable "state" {
  type        = string
  default     = "ENABLED"
  description = "State of the workgroup. Valid values are DISABLED or ENABLED. Defaults to ENABLED."
  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.state)
    error_message = "Allowed values for state: DISABLED or ENABLED.?"
  }
}
