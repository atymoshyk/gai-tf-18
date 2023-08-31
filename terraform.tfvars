# Networking vars
vpc_cidr = "10.0.0.0/16"
subnets = {
  "public-subnet-1" = {
    cidr = "10.0.20.0/22"
    az   = "euw1-az2"
    public = "yes"
  }
  "private-subnet-1" = {
    cidr = "10.0.24.0/22"
    az   = "euw1-az1"
    public = "no"
  }
}
# public_subnets = {
#   "public-subnet-1" = {
#     cidr = "10.0.28.0/22"
#     az   = "euw1-az2"
#   }
# }
# private_subnets = {
#   "private-subnet-1" = {
#     cidr = "10.0.32.0/22"
#     az   = "euw1-az1"
#   }
# }

# EC2 instances
instances = {
  public_instance = {
    instance_type  = "t3.micro"
    ami_prefix     = "al2023-ami-2023"
    ami_arch       = "x86_64"
    network_mode   = "public"
    subnet_seq_num = 0
  }
  private_instance = {
    instance_type  = "t3.micro"
    ami_prefix     = "al2023-ami-2023"
    ami_arch       = "x86_64"
    network_mode   = "private"
    subnet_seq_num = 0
  }
}
