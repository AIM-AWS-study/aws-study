module "security_group" {
  source = "./modules/sg"
  for_each = { for instance in local.config.security_group : instance.name => instance }
  config = each.value
}


module "s3" {
  source = "./modules/s3"
  for_each = { for bucket in local.config.s3 : bucket.name => bucket }
  config = each.value
}

module "auto-scaling" {
  source = "./modules/auto-scaling"
  for_each = { for instance in local.config.auto-scaling : instance.name => instance }
  config = each.value
}

module "elb" {
  source = "./modules/elb"
  for_each = { for elb in local.config.elb : elb.name => elb }
  config = each.value
}


module "rds" {
  source = "./modules/rds"
  for_each = { for rds in local.config.rds : rds.identifier => rds }
  config = each.value
  depends_on = [module.security_group]
}
