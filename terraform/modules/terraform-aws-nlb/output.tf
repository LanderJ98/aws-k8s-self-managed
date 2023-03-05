output "lb_name" {
  value = aws_lb.lb.name
}

output "lb_dns_name" {
  value = aws_lb.lb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.k8s.arn
}
