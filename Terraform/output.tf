output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.main["public1"].id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.main["private_1"].id,
    aws_subnet.main["private_2"].id,
    aws_subnet.main["private_3"].id
  ]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "security_groups" {
  value = {
    alb_sg          = aws_security_group.alb_sg.id
    frontend_sg     = aws_security_group.frontend_sg.id
    redis_worker_sg = aws_security_group.redis_worker_sg.id
    postgres_sg     = aws_security_group.postgres_sg.id
  }
}