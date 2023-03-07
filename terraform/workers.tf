module "workers" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = var.num_of_workers

  name = "worker-${count.index}"

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  monitoring                  = true
  vpc_security_group_ids      = [module.worker_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[1]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}