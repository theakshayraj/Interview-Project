data "aws_vpc" "int" {
  tags = {
    Name = "interview"
  }
}

data "aws_subnet" "private" {
   vpc_id = data.aws_vpc.int.id
   tags = {
    Name = "interview-private-subnet"
  }
}
data "aws_subnet" "public" {
   vpc_id = data.aws_vpc.int.id
   tags = {
    Name = "interview-public-subnet"
  }
}

module "security_group_asg" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-security-group.git?ref=v4.0.0"

  name   = "interview-sg"
  vpc_id = data.aws_vpc.int.id
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "Open internet"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 50500
      to_port     = 50500
      protocol    = "tcp"
      description = "Pntr"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 13360
      to_port     = 13360
      protocol    = "tcp"
      description = "mysql"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 14460
      to_port     = 14460
      protocol    = "tcp"
      description = "postg"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 15560
      to_port     = 15560
      protocol    = "tcp"
      description = "mongo"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

