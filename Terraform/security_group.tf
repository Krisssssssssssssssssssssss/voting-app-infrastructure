
# # Security group for Redis/Worker service
# resource "aws_security_group" "redis_worker_sg" {
#   name        = "redis_worker_sg"
#   description = "Allow Redis/Worker service traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     from_port   = 6379
#     to_port     = 6379
#     protocol    = "tcp"
#     security_groups = [aws_security_group.vote_result_sg.id]
#   }

#   egress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     security_groups = [aws_security_group.postgres_sg.id]
#   }
# }

# # Security group for Postgres service
# resource "aws_security_group" "postgres_sg" {
#   name        = "postgres_sg"
#   description = "Allow Postgres DB service traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     security_groups = [aws_security_group.redis_worker_sg.id]
#   }

#   # Optional: Allow Vote/Result direct access
#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     security_groups = [aws_security_group.vote_result_sg.id]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
