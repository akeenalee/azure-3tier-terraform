variable "location" {
  default = "North Europe"
}

variable "prefix" {
  default = "alli"
}

variable "sql_admin_username" {
  description = "SQL admin username"
  type        = string
  sensitive   = true
}

variable "sql_admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}