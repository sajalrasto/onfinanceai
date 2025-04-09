output "cluster_endpoint" {
  description = "The DNS address of the RDS cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "reader_endpoint" {
  description = "A read-only endpoint for the Aurora cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "security_group_id" {
  description = "The security group ID attached to the RDS cluster"
  value       = aws_security_group.rds.id
}
