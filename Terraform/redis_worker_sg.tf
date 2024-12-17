resource "aws_security_group" "redis_worker_sg" {
  name        = "allow_redis_worker_traffic"
  description = "Allow traffic to and from Redis and Worker EC2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow Redis traffic from Frontend"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.frontend_sg.id]
  }

  ingress {
    description = "Allow Worker communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

ingress {
  description     = "Allow SSH from Bastion Host"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [aws_security_group.bastion_sg.id]
}

  egress {
    description = "Allow traffic to PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.postgres_sg.id]
  }

  tags = {
    Name = "kri-redis_worker_sg"
  }
}
