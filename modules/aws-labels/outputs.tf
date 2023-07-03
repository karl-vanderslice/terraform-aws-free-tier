output "id" {
  value       = local.id
  description = "Generated ID"
}

output "namespace" {
  value       = local.namespace
  description = "Namespace"
}

output "tenant" {
  value       = local.tenant
  description = "Tenant"
}

output "environment" {
  value       = local.environment
  description = "Environment"
}

output "account" {
  value       = local.account
  description = "Account"
}

output "name" {
  value       = local.name
  description = "Name"
}

output "attributes" {
  value       = local.attributes
  description = "Additional attributes"
}

output "tags" {
  value       = local.tags
  description = "Additional tags"
}

output "createdby" {
  value       = local.createdby
  description = "Created By value"
}

output "managedby" {
  value       = local.managedby
  description = "Managed By value"
}

output "id_labels" {
  value       = local.id_labels
  description = "Generated set of labels"
}
