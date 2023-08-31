variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type        = string
}

variable "names_prefix" {
  description = "Prefix that is added to all resources names"
  type        = string
  default     = "atymoshy"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "test"
}

variable "subnets" {
  description = "A list of subnets inside the VPC"
  type        = map(any)
  default     = {}
}

variable "shared_tags" {
  description = "Tags that are applied to all resources"
  type        = map(any)
  default = {
    "Owner" : "atymoshy",
    "CreatedBy" : "Terraform"
  }
}

variable "vpc_tags" {
  description = "Tags that are applied to VPC resources"
  type        = map(any)
  default     = {}
}


# EC2 instances
variable "instances" {
  description = "EC2 instances map"
  type        = map(any)
  default     = {}
}
