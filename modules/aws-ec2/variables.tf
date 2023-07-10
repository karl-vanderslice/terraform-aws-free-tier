variable "name" {
  description = "Name for the created VPC and resources."
  type        = string
}

variable "tags" {
  description = "Tags to apply to created resources."
  type        = map(string)
  default     = {}
}

variable "instance_count" {
  description = "Number of instances to create."
  type        = number
  default     = 1
}

variable "instance_ami" {
  description = "AMI to use in place of the default latest Amazon Linux 2 AMI.  See `data.tf` for AMI lookup."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Instance size to provision.  Defaults to free tier t2.micro."
  type        = string
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "Public Subnet to provision the EC2 instance in."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to provision the EC2 instance in."
  type        = string
}

variable "public_key_pair_path" {
  description = "Path to public key to add to the instance."
  type        = string
}
