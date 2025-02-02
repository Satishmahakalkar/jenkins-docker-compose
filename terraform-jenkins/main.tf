module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
}

module "eip" {
  source      = "./modules/eip"
  instance_id = module.ec2.instance_id
}

