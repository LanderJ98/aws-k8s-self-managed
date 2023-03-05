resource "aws_lb" "lb" {
  name               = var.lb_name
  load_balancer_type = "network"
  subnets            = var.lb_subnet_ids
  #tags = var.tags
}

resource "aws_lb_listener" "k8s" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "6443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.k8s.arn
  }
}

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.lb.arn
#   port              = "443"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.https.arn
#   }
# }

# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.lb[0].arn
#   port              = "80"
#   protocol          = "TCP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.http.arn
#   }
# }

resource "aws_lb_target_group" "k8s" {
  name        = var.k8s_target_group_name
  port        = 6443
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  #tags = var.tags
}