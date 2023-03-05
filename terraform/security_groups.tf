module "controller_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.controller_sg_name
  description = "Security group for controller instances"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = 6
      description = "SSH ACCESS"
      cidr_blocks = var.cidr_blocks
    },
    {
      from_port   = 6443
      to_port     = 6443
      protocol    = 6
      description = "Kube API access"
      cidr_blocks = var.cidr_blocks
    },
        {
      from_port   = 2379
      to_port     = 2380
      protocol    = 6
      description = "Kube API access"
      cidr_blocks = var.vpc_cidr
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65355
      protocol    = 6
      description = "Allow All"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}