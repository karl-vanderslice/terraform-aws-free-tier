output "instance_id" {
  description = "The ID of the created instance(s)"
  value       = aws_instance.ec2[*].id
}

output "instance_arn" {
  description = "The ARN of the created instance(s)"
  value       = aws_instance.ec2[*].arn
}

output "instance_ip" {
  description = "The public IP of the created instance(s)"
  value       = aws_instance.ec2[*].public_ip
}
