resource "aws_vpc" "vpc" { #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
  # TODO: Clean all this up
  #checkov:skip=CKV2_AWS_12:TODO, default sec group
  #checkov:skip=CKV2_AWS_11:TODO, flow logs
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}
