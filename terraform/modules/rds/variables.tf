variable "name_prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "onfinance"
}

variable "master_username" {
  description = "Database master username"
  type        = string
  sensitive   = true
}

variable "master_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "13.7"
}

variable "instance_class" {
  description = "Instance class for database"
  type        = string
  default     = "db.t3.medium"
}
