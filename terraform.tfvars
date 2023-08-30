vpc_cidr = "10.0.0.0/16"
public_subnets = {
  "public-subnet-1" = {
    cidr = "10.0.28.0/22"
    az   = "euw1-az2"
  }
}
private_subnets = {
  "private-subnet-1" = {
    cidr = "10.0.32.0/22"
    az   = "euw1-az1"
  }
}
