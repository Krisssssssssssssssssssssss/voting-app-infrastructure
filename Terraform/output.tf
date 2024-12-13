output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.main["public"].id
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