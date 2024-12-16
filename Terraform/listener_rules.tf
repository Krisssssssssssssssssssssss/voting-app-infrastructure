# resource "aws_lb_listener" "http_listener" {
#   load_balancer_arn = aws_lb.frontend_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Invalid path"
#       status_code  = "404"
#     }
#   }
# }

# resource "aws_lb_listener_rule" "vote_rule" {
#   listener_arn = aws_lb_listener.http_listener.arn
#   priority     = 100

#   condition {
#     path_pattern {
#       values = ["/vote*"]
#     }
#   }

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.vote_target_group.arn
#   }
# }

# resource "aws_lb_listener_rule" "result_rule" {
#   listener_arn = aws_lb_listener.http_listener.arn
#   priority     = 200

#   condition {
#     path_pattern {
#       values = ["/result*"]
#     }
#   }

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.result_target_group.arn
#   }
# }
