module "apps-lb" {
  source                  = "./modules/terraform-aws-nlb"
  lb_subnet_ids           = module.vpc.public_subnets
  vpc_id                  = module.vpc.vpc_id
  lb_name                 = "apps-lb"
  https_enabled           = true
  http_port               = var.http_port
  http_target_group_name  = "apps-http-tg"
  https_port              = var.https_port
  https_target_group_name = "apps-https-tg"

}

resource "aws_lb_target_group_attachment" "http_worker_targets" {
  count            = var.num_of_workers
  target_group_arn = module.apps-lb.http_target_group_arn
  target_id        = module.workers[count.index].id
  port             = var.http_port
}

resource "aws_lb_target_group_attachment" "https_worker_targets" {
  count            = var.num_of_workers
  target_group_arn = module.apps-lb.https_target_group_arn
  target_id        = module.workers[count.index].id
  port             = var.https_port
}