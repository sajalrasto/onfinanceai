variable "name_prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block for security group rules"
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
  default     = "15.3"  # Current stable version as of 2023
}

variable "allow_major_version_upgrade" {
  description = "Enable major version upgrade"
  type        = bool
  default     = false
}
variable "instance_class" {
  description = "Instance class for database"
  type        = string
  default     = "db.t3.medium"
}
