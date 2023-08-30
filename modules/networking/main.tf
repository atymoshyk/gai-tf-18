resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.shared_tags,
    var.vpc_tags,
    {
      Name = var.vpc_name
    },
  )
}

# Public subnet resources
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  availability_zone_id = each.value["az"]
  cidr_block           = each.value["cidr"]
  vpc_id               = aws_vpc.main.id

  tags = merge(
    var.shared_tags,
    var.vpc_tags,
    {
      Name = "${each.key}-${each.value["az"]}"
    },
  )
}

# Private subnet resources
resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets

  availability_zone_id = each.value["az"]
  cidr_block           = each.value["cidr"]
  vpc_id               = aws_vpc.main.id

  tags = merge(
    var.shared_tags,
    var.vpc_tags,
    {
      Name = "${each.key}-${each.value["az"]}"
    },
  )
}
