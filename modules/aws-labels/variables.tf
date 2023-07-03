variable "enabled" {
  description = "Set to false to prevent resources from being created."
  type        = bool
  default     = null
}

variable "namespace" {
  description = "Unique identifier for created resources.  This might be something like a `company`, `project`, or `team` name."
  type        = string
  default     = null
}

variable "tenant" {
  description = "Tenant could be a user, end-user, or other type of 'customer of a customer'."
  type        = string
  default     = null
}

variable "environment" {
  description = "Name or role of the account the resource belongs to - for example: `dev`, `test`, `prod`."
  type        = string
  default     = "dev"
}

variable "account" {
  description = "Accounting identifier - for example, cost code or AWS Account number"
  type        = string
  default     = null
}

variable "name" {
  description = "Name for created resources.  This might be something like an application or solution name."
  type        = string
  default     = ""
}

variable "delimiter" {
  description = "Delimiter to use between resources."
  type        = string
  default     = "-"
}

variable "attributes" {
  description = "Additional set of attributes to append to the created resource, as `primary`, `west`, or `001`."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional set of tags to add, for example {\"contact\" = \"devops@company.io\"}."
  type        = map(string)
  default     = {}
}

variable "createdby" {
  description = "Created By tag, example: 'terraform'"
  type        = string
  default     = "terraform"
}

variable "managedby" {
  description = "Managed By tag, example: 'devops'"
  type        = string
  default     = "devops"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Override label order for one or more of `namespace`, `name`, `environment`."
}
