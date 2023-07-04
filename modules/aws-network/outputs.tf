output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "ARN of the created VPC"
  value       = aws_vpc.vpc.arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "route_table_id" {
  description = "The ID of the created Route Table"
  value       = aws_route_table.rt.id
}

output "public_subnet_id" {
  description = "ID of the created public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_arn" {
  description = "ARN of the created public subnet"
  value       = aws_subnet.public.arn
}

output "internet_gateway_id" {
  description = "ID of the created internet gateway"
  value       = aws_internet_gateway.igw.id
}
