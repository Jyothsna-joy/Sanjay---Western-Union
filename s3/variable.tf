variable "aws_region" {
  description = "The AWS region to be used to create resources."
  default     = "us-east-1"
}

variable "bucket_prefix" {
    type = string
    description = "Creates a unique bucket name beginning with the specified prefix."
    default = "sanjay-demo-bucket-"
}

variable "acl" {
    type = string
    description = "Defaults to private."
    default = "private"
}
variable "object_lock_enabled" {
  description = "Whether S3 bucket should have an Object Lock configuration enabled."
  type        = bool
  default     = false
}

variable "versioning" {
    type = bool
    description = "A state of versioning"
    default = "true"
} 


variable "tags" {
    type = map
    description = "A mapping of tags to assign to the bucket."
    default = {
        environment = "DEV"
    }
}
