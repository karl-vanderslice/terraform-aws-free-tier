locals {

  default_label_order = ["name", "environment"]

  # generate the id for created resources
  id_context = {
    name        = var.name
    environment = var.environment
  }

  # determine order for labels
  label_order = length(var.label_order) > 0 ? var.label_order : local.default_label_order

  # construct the id
  id_labels = [for l in local.label_order : local.id_context[l] if length(local.id_context[l]) > 0]
  id        = lower(join(var.delimiter, local.id_labels, var.attributes))

  # validate tags
  name        = var.enabled == true ? lower(format("%v", var.name)) : ""
  namespace   = var.enabled == true ? lower(format("%v", var.namespace)) : ""
  tenant      = var.enabled == true ? lower(format("%v", var.tenant)) : ""
  environment = var.enabled == true ? lower(format("%v", var.environment)) : ""
  account     = var.enabled == true ? lower(format("%v", var.account)) : ""
  createdby   = var.enabled == true ? lower(format("%v", var.createdby)) : ""
  managedby   = var.enabled == true ? lower(format("%v", var.managedby)) : ""
  attributes  = var.enabled == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : ""

  tags = merge(
    {
      "Name"        = local.id
      "Namespace"   = local.namespace
      "Environment" = local.environment
      "Tenant"      = local.tenant
      "Account"     = local.account
      "CreatedBy"   = local.createdby
      "ManagedBy"   = local.managedby
    },
    var.tags
  )

}
