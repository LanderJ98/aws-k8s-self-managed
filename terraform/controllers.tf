module "controllers" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = var.num_of_controllers

  name = "controller-${count.index}"

  ami                         = var.ami_id
  instance_type               = var.instance_type
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  key_name                    = aws_key_pair.deployer.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.controller_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[count.index]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}