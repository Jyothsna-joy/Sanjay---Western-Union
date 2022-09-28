variable business_unit {
  type = string
  description = "Choose your Business Unit."
  validation {
    condition = contains(["CMT", "Compliance", "Corporate", "CustomHouse", "DataAndAnalytics", "Digital", "Domain", "OrlandiValuta", "Paymap", "Speedpay", "Vigo", "WUBS", "WesternUnion"], var.business_unit)
    error_message = "Allowed values for Business Unit: CMT, Compliance, Corporate, CustomHouse, DataAndAnalytics, Digital, Domain, OrlandiValuta, Paymap, Speedpay, Vigo, WUBS, WesternUnion."
  }
}

variable aws_region {
  type = string
  description = "Choose you AWS region for resource provisioning."
  validation {
    condition = contains(["us-east-1", "us-east-2", "us-west-2", "eu-central-1", "ap-southeast-1"], var.aws_region)
    error_message = "Allowed values for Region: us-east-1, us-east-2, eu-central-1, ap-southeast-1, us-west-2."
  }
}

variable production_level_code {
  type = string
  description = "Choose your Production Level Code."
  validation {
    condition = contains(["Development", "QA", "UAT", "Performance", "PreProd", "Demo", "Spare", "ProductionNextDay", "Production4hoursfix", "MissionCritical"], var.production_level_code)
    error_message = "Allowed values for Production Level Code: Development, QA, UAT, Performance, PreProd, Demo, Spare, ProductionNextDay, Production4hoursfix, MissionCritical."
  }
}

variable environment {
  type = string
  description = "Provide value for tag: Environment"
  validation {
    condition = contains(["DEV", "QA", "STAGE", "UAT", "PROD"], var.environment)
    error_message = "Allowed values for Environment tag: DEV, QA, STAGE, UAT, PROD."
  }
}

variable application_name {
  type = string
  description = "Provide value for tag: ApplicationName"
}

variable application_code {
  type = string
  description = "Provide value for tag: ApplicationCode"
}

variable security_posture {
  type = string
  description = "Provide value for tag: SecurityPosture"
  validation {
    condition = contains(["PCI", "NON PCI"], var.security_posture)
    error_message = "Allowed values for SecurityPosture tag: PCI, NON PCI."
  }
}

variable support_contact {
  type = string
  description = "Provide value for tag: SupportContact"
}

variable application_owner {
  type = string
  description = "Provide value for tag: ApplicationOwner"
}

variable product_tower {
  type = string
  description = "Provide value for tag: ProductTower"
}

variable domain {
  type = string
  description = "Provide value for tag: Domain"
}

variable patch_group {
  type = string
  description = "Provide value for tag: PatchGroup"
}

variable request_id {
  type = string
  description = "Provide value for tag: RequestID"
}

variable cost_center {
  type = string
  description = "Provide value for tag: CostCenter"
  validation {
    condition = can(regex("^\\d{4}$", var.cost_center)) 
    error_message = "Cost Center Code should be a 4-digit number."
  }
}