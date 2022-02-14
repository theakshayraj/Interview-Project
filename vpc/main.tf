
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "project-vpc"
  cidr                 = "10.99.0.0/18"
  azs             = ["ap-south-1b"]
  public_subnets  = ["10.99.0.0/24"]
  private_subnets = ["10.99.3.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = "interview"
  }
  private_subnet_tags = {
    Name = "interview-private-subnet"
  }

  public_subnet_tags = {
    Name = "interview-public-subnet"
  }

}