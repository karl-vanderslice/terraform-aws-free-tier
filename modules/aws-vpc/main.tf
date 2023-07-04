resource "aws_vpc" "vpc" { #tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
  # TODO: Clean all this up
  #checkov:skip=CKV2_AWS_12:TODO, default sec group
  #checkov:skip=CKV2_AWS_11:TODO, flow logs
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    { "Name" = var.name },
    var.tags
  )
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[0]
  map_public_ip_on_launch = false

  tags = merge(
    { "Name" = "${var.name}-pub" },
    var.tags
  )

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(
    { "Name" = var.name },
    var.tags
  )

}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    { "Name" = "${var.name}-igw" },
    var.tags
  )

}
