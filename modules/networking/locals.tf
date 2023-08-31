locals {
  public_subnets  = [for each in aws_subnet.subnets : each.id if var.subnets[each.tags.tfname].public == "yes"]
  private_subnets = [for each in aws_subnet.subnets : each.id if var.subnets[each.tags.tfname].public == "no"]
}
