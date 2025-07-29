
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "frontend" {
  source = "./modules/ec2"
  name   = "frontend"
  subnet_id = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_groups.frontend_sg_id]
}

module "backend" {
  source = "./modules/ec2"
  name   = "backend"
  subnet_id = module.vpc.private_subnet_ids[0]
  security_group_ids = [module.security_groups.backend_sg_id]
}

module "rds" {
  source = "./modules/rds"
  subnet_ids = module.vpc.database_subnet_ids
  security_group_ids = [module.security_groups.rds_sg_id]
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnet_ids
  private_subnets = module.vpc.private_subnet_ids
}
