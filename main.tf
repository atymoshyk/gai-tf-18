module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets
}

module "instances" {
  for_each      = var.instances
  source        = "./modules/ec2"
  instance_type = each.value.instance_type
  ami_prefix    = each.value.ami_prefix
  ami_arch      = each.value.ami_arch
  name          = each.key
  subnet_id     = local.instances_subnets[each.key][each.value.subnet_seq_num]
  tags = {
    "Owner" : "atymoshy",
    "CreatedBy" : "Terraform",
    "Name" : each.key
  }
}
