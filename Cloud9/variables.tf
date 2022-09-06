variable "name" {
  type        = string
  description = "The name of the environment."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of instance to connect to the environment"
}

variable "connection_type" {
  type        = string
  default     = null
  description = "The connection type used for connecting to an Amazon EC2 environment."
}

variable "description" {
  type        = string
  default     = null
  description = "Sample Clod9 Environment"
}


variable "image_id" {
  type        = string
  default     = "amazonlinux-1-x86_64"
  description = "The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance."
  validation {
    condition = contains(["amazonlinux-1-x86_64","amazonlinux-2-x86_64", "ubuntu-18.04-x86_64" , "resolve:ssm:/aws/service/cloud9/amis/amazonlinux-1-x86_64", "resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64", "resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64"], var.image_id)
    error_message = "Must be a valid image id?"
  }
}

variable "owner_arn" {
  type        = string
  default     = ""
  description = "The ARN of the environment owner. This can be ARN of any AWS IAM principal. Defaults to the environment's creator."
}


variable "subnet_id" {
  type        = string
  default     = "subnet-9bbe4bd6"
  description = "The ID of the subnet in Amazon VPC that AWS Cloud9 will use to communicate with the Amazon EC2 instance."
}

variable automatic_stop_time_minutes {
  type        = number
  default     = 30
  description = "The number of minutes until the running instance is shut down after the environment has last been used."
}
