resource "aws_security_group" "postgres_sg" {
  name        = "allow_postgres_traffic"
  description = "Allow traffic to and from PostgreSQL"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow traffic from Worker Service"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      aws_subnet.main["private_1"].cidr_block,
      aws_subnet.main["private_2"].cidr_block
    ]
  }
  ingress {
  description     = "Allow SSH from Bastion Host"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [aws_security_group.bastion_sg.id]
}


  tags = {
    Name = "kri-postgres_sg"
  }
}
