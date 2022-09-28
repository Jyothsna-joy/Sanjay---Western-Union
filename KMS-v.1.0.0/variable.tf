variable "common_tags" {
  description = "Mention mandatory tags if any."
  type        = map(any)
  default     = {}
}

variable "additional_tags" {
  description = "Mention additional tags if any."
  type        = map(any)
  default     = {}
}


variable "name" {
  type = string
  //default     = "alias/Test-KMS-Key"
  description = "The display name of the alias. The name must start with the word alias followed by a forward slash (alias/)"
  validation {
    condition     = can(regex("^[a-zA-Z0-9-/]+$", var.name))
    error_message = "Name should contain only alphanumeric characters and dash."
  }
}

variable "name_prefix" {
  type        = string
  default     = null
  description = "Creates an unique alias beginning with the specified prefix."
}

variable "description" {
  type        = string
  default     = "KMS Key Test Case"
  description = "The description of the key as viewed in AWS console."
}

variable "key_usage" {
  type = string
  //default     = "ENCRYPT_DECRYPT"
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT."
  validation {
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY"], var.key_usage)
    error_message = "Valid values for key_usage must be either ENCRYPT_DECRYPT or SIGN_VERIFY."
  }
}
variable "customer_master_key_spec" {
  type = string
  //default     = "SYMMETRIC_DEFAULT"
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports."
  validation {
    condition     = contains(["SYMMETRIC_DEFAULT", "RSA_2048", "RSA_3072", "RSA_4096", "HMAC_256", "ECC_NIST_P256", "ECC_NIST_P384", "ECC_NIST_P521", "ECC_SECG_P256K1"], var.customer_master_key_spec)
    error_message = "Valid values for customer_master_key_spec must be either SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_256, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1."
  }
}

variable "policy" {
  type        = string
  default     = null
  description = "A valid policy JSON document. "
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  default     = null
  description = "A flag to indicate whether to bypass the key policy lockout safety check"
}

variable "deletion_window_in_days" {
  type = number
  //default     = "7"
  description = "The waiting period, specified in number of days. If you specify a value, it must be between 7 and 30. defaults to 30."
  validation {
    condition     = (var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30)
    error_message = "Valid values for deletion_window_in_days must be between 7 and 30."
  }
}

variable "is_enabled" {
  type = bool
  //default     = true
  description = "Specifies whether the key is enabled. Defaults to true."
}

variable "enable_key_rotation" {
  type = string
  //default     = false
  description = "Specifies whether key rotation is enabled. Defaults to false."
}

variable "multi_region" {
  type = string
  // default     = false
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false."
}

# variable enabled {
#   type        = bool
#   default     = true
#   description = " Specifies whether the key is enabled"
# }

# variable key_material_base64 {
#   type        = string
#   default     = null
#   description = "Base64 encoded 256-bit symmetric encryption key material to import."
# }

# variable valid_to {
#   type        = string
#   default     = null
#   description = "Time at which the imported key material expires."
# }
