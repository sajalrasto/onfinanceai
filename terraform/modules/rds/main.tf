resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "${var.name_prefix}-aurora-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = var.engine_version
  engine_mode             = "provisioned"
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.rds.id]
  db_subnet_group_name    = aws_db_subnet_group.main.name
  skip_final_snapshot     = true
  storage_encrypted       = true
  allow_major_version_upgrade = var.allow_major_version_upgrade
  enable_http_endpoint    = false
  
  lifecycle {
    ignore_changes = [master_password]
  }
}

resource "aws_rds_cluster_instance" "instances" {
  count              = 2
  identifier         = "${var.name_prefix}-aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.aurora.engine
  engine_version     = aws_rds_cluster.aurora.engine_version
  publicly_accessible = false
  promotion_tier     = count.index + 1
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.name_prefix}-subnet-group"
  subnet_ids = var.private_subnets
  tags = {
    Name = "${var.name_prefix}-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.name_prefix}-rds-sg"
  description = "Allow traffic to Aurora from EKS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow PostgreSQL from EKS"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
