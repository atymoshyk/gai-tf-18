output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = local.public_subnets
}

output "private_subnets" {
  value = local.private_subnets
}
