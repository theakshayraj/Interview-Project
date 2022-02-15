
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "interview"
  cidr                 = "172.32.0.0/16"
  azs             = ["ap-south-1b", "ap-south-1c", "ap-south-1a"]
  public_subnets  = ["172.32.6.0/24", "172.32.7.0/24", "172.32.8.0/24"]
  private_subnets = ["172.32.9.0/24", "172.32.10.0/24", "172.32.11.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true

}