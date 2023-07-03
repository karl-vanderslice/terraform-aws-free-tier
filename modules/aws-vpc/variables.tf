variable "vpc_cidr_block" {
  description = "IPv4 CIDR block for the created VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Enable/Disable DNS Support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable/Disable support for DNS Hostnames in the VPC"
  type        = bool
  default     = true
}
