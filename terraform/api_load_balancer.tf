module "k8s-lb" {
  source        = "./modules/terraform-aws-nlb"
  lb_subnet_ids = module.vpc.public_subnets
  vpc_id        = module.vpc.vpc_id

}

resource "aws_lb_target_group_attachment" "controller_targets" {
  count            = var.num_of_controllers
  target_group_arn = module.k8s-lb.target_group_arn
  target_id        = module.controllers[count.index].id
  port             = var.kube_api_port
}