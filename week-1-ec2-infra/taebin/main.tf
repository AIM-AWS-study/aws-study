module "ec2" {
  source = "./modules/ec2"
  for_each = { for instance in local.config.ec2 : instance.name => instance }
  config = each.value
}

module "security_group" {
  source = "./modules/sg"
  for_each = { for instance in local.config.security_group : instance.name => instance }
  config = each.value
}
