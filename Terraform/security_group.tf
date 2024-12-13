# Define Security Groups

resource "aws_security_group" "vote_result_sg" {
  name        = "vote_result_sg"
  description = "Allow traffic for Vote/Result service"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound to Redis and Postgres
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.redis_worker_sg.id, aws_security_group.postgres_sg.id]
  }
}

resource "aws_security_group" "redis_worker_sg" {
  name        = "redis_worker_sg"
  description = "Allow Redis/Worker service traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    security_groups = [aws_security_group.vote_result_sg.id]  # Allow traffic from Vote/Result
  }

  # Outbound to Postgres
  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.postgres_sg.id]  # Allow traffic to Postgres
  }
}

resource "aws_security_group" "postgres_sg" {
  name        = "postgres_sg"
  description = "Allow Postgres DB service traffic"
  vpc_id      = var.vpc_id

  # Allow inbound traffic from Redis/Worker
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.redis_worker_sg.id]  # Allow traffic from Redis/Worker
  }

  # Optionally allow direct access from Vote/Result
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.vote_result_sg.id]  # If needed directly from Vote/Result
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
