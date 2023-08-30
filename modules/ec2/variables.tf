variable "tags" {
  description = "Tags that are applied to all resources"
  type        = map(any)
}

variable "name" {
  type = string
}

variable "names_prefix" {
  description = "Prefix that is added to all resources names"
  type        = string
  default     = "atymoshy"
}

variable "ami_arch" {
  type = string
}

variable "ami_prefix" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type    = string
  default = ""
}
