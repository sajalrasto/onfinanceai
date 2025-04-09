output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnets
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnets
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "database_endpoint" {
  description = "RDS cluster endpoint"
  value       = module.database.cluster_endpoint
  sensitive   = true
}

output "database_reader_endpoint" {
  description = "RDS reader endpoint"
  value       = module.database.reader_endpoint
  sensitive   = true
}

output "database_security_group_id" {
  description = "RDS security group ID"
  value       = module.database.security_group_id
}
