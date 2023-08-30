variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "test"
}

variable "vpc_azs" {
  description = "A list of VPC's AZs"
  type        = list(string)
  default     = ["euw1-az2"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = map(any)
  default     = {}
}

variable "private_subnets" {
  description = "A list of public subnets inside the VPC"
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

variable "private_subnets_tags" {
  description = "Tags that are applied to private subnets"
  type        = map(any)
  default     = {}
}

variable "public_subnets_tags" {
  description = "Tags that are applied to public subnets"
  type        = map(any)
  default     = {}
}
