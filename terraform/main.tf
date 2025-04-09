module "networking" {
  source = "./modules/networking"
  
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

module "eks" {
  source = "./modules/eks"
  
  cluster_name    = "onfinance-ai"
  vpc_id          = module.networking.vpc_id
  private_subnets = module.networking.private_subnets
  public_subnets  = module.networking.public_subnets
  
  node_groups = {
    main = {
      desired_size = 3
      max_size     = 5
      min_size     = 3
      instance_types = ["t3.medium"]
    }
  }
}

module "database" {
  source = "./modules/rds"
  
  name_prefix      = "onfinance-ai"
  vpc_id          = module.networking.vpc_id
  vpc_cidr        = module.networking.vpc_cidr_block
  private_subnets = module.networking.private_subnets
  master_username = var.database_username
  master_password = var.database_password
  instance_class  = "db.t3.medium"
  engine_version  = "15.3"  
}
