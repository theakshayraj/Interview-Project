output "vpc_id_all" {
  value = data.aws_vpc.int.id
}

output "public_sn_asg" {
  value = [data.aws_subnet.public.id]
}

output "private_sn_asg" {
  value = [data.aws_subnet.private.id]
}

output "security_group_id_asg" {
  value = module.security_group_asg.security_group_id
}
