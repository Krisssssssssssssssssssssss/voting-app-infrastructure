# resource "aws_lb_target_group" "vote_target_group" {
#   name        = "vote-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.main.id
#   target_type = "instance"

#   health_check {
#     path                = "/vote"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 3
#     unhealthy_threshold = 2
#   }
# }

# resource "aws_lb_target_group" "result_target_group" {
#   name        = "result-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id      = aws_vpc.main.id
#   target_type = "instance"

#   health_check {
#     path                = "/result"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 3
#     unhealthy_threshold = 2
#   }
# }

# resource "aws_lb_target_group_attachment" "vote_attachment" {
#   target_group_arn = aws_lb_target_group.vote_target_group.arn
#   target_id        = aws_instance.frontend.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "result_attachment" {
#   target_group_arn = aws_lb_target_group.result_target_group.arn
#   target_id        = aws_instance.frontend.id
#   port             = 80
# }

