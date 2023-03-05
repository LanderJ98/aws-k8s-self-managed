output "public_subnets" {
  value = module.vpc.public_subnets
}

output "master-controller" {
  value = try(module.ec2_instance[0].public_ip, null)
}

output "addtitional-controllers" {
  value = try(slice(module.ec2_instance, 1, var.num_of_controllers).*.public_ip, null)
}

output "kube_api_lb" {
  value = module.k8s-lb.lb_dns_name
}