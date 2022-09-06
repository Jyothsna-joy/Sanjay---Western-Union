
variable  db_name {
    description = "The database name."
    default = "sanjay_demo_rds44"
    type = string
}

variable identifier {
    description = "The name of RDS Instance"
    default = "sanjay-demo-rds-db"
    type = string
}


variable engine {
  default = "MySQL"
  description = "Type of the Database Engine"
}

variable availability_zone {
  default = "us-east-1a"
  description = "Specify the region in which resource is being created"
}

variable engine_version {
  default = "8.0.28"
  description = "Version of the Database Engine needs to be created"
}

variable instance_class {
  default = "db.t3.micro"
  description = "Choose the DB instance type that allocates the computational, network, and memory capacity required by planned workload of this DB instance."
}

variable password {
  default = "sanjayrds1234"
  description = "Specify a string that defines the password for the master user. Master Password must be at least eight characters long"
}

variable username {
  default = "sanju"
  description = "Specify an alphanumeric string that defines the login ID for the master user."
  validation {
    condition = can(regex("^[a-zA-Z0-9]+$", var.username))
    error_message = "Only alphanumeric strings are allowed?"
  }
}

variable allocated_storage {
  description = "Storage allocated in GB"
  default = 10
}


variable ca_cert_identifier {
    description = "he identifier of the CA certificate for the DB instance."
    default = ""
}

variable skip_final_snapshot {
    description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
    default = true
    type = bool
}

variable "backup_retention_period" {
  description = "(Optional) Automatically keep backups for point-in-time recovery for XX days(1-35). When providing '0' as a value backups will be disabled.The default is 14 if not specified."
  type        = number
  default     = 0
}

variable "backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window. The default is '00:00-02:00' if not specified"
  type        = string
  default     = "00:00-02:00"
}


variable "storage_type" {
  description = "(Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'gp2' if not specified."
  type        = string
  default     = "gp2"
}


variable port {
  default = 3306
  description = "Specify the TCP/IP port that the DB instance will use for application connections."
  type = number
}




