output "instance_public_ip" {
  description = "Public IP of the created instance(s)."
  value       = module.ec2.instance_ip
}
