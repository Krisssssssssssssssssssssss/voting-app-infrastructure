resource "aws_lb" "frontend_alb" {
  name               = "kri-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    aws_subnet.main["public1"].id,
    aws_subnet.main["public2"].id
  ]

  tags = {
    Name = "kri-frontend-alb"
    Env  = var.env
  }
}
