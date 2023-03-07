output "lb_name" {
  value = aws_lb.lb.name
}

output "lb_dns_name" {
  value = aws_lb.lb.dns_name
}

output "http_target_group_arn" {
  value = aws_lb_target_group.http_tg.arn
}


output "https_target_group_arn" {
  value =  var.https_enabled ? aws_lb_target_group.https_tg[0].arn : null
}
