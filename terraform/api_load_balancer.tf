module "k8s-lb" {
  source        = "./modules/terraform-aws-nlb"
  lb_subnet_ids = module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id
  lb_name = "k8s-lb"
  https_enabled = false
  http_port          = var.kube_api_port
  http_target_group_name = "Kube-api-server-tg"

}

resource "aws_lb_target_group_attachment" "controller_targets" {
  count            = var.num_of_controllers
  target_group_arn = module.k8s-lb.http_target_group_arn
  target_id        = module.controllers[count.index].id
  port             = var.kube_api_port
}