resource "aws_lb" "lb" {
  name               = var.lb_name
  load_balancer_type = var.load_balancer_type
  subnets            = var.lb_subnet_ids
  #tags = var.tags
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.http_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_tg.arn
  }
}

resource "aws_lb_listener" "https" {
  count = var.https_enabled ? 1 : 0
  load_balancer_arn = aws_lb.lb.arn
  port              = var.https_port
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https_tg[count.index].arn
  }
}

resource "aws_lb_target_group" "http_tg" {
  name        = var.http_target_group_name
  port        = var.http_port
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  #tags = var.tags
}

resource "aws_lb_target_group" "https_tg" {
  count = var.https_enabled ? 1 : 0
  name        = var.https_target_group_name
  port        = var.https_port
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  #tags = var.tags
}