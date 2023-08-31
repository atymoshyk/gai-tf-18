resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.shared_tags,
    var.vpc_tags,
    {
      Name = "${var.names_prefix}-${var.vpc_name}"
    },
  )
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  availability_zone_id = each.value["az"]
  cidr_block           = each.value["cidr"]
  vpc_id               = aws_vpc.main.id

  tags = merge(
    var.shared_tags,
    var.vpc_tags,
    {
      Name   = "${var.names_prefix}-${each.key}-${each.value["az"]}",
      tfname = "${each.key}"
    },
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      "Name" = "${var.names_prefix}-igw"
    },
    var.shared_tags,
    var.vpc_tags
  )
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    {
      "Name" = "${var.names_prefix}-PublicRT"
    },
    var.shared_tags,
    var.vpc_tags
  )
}

resource "aws_route_table_association" "public_rt" {
  for_each       = { for k, v in var.subnets : k => v if length(split("public", k)) > 1 }
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.public_rt.id
}
