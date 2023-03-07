resource "local_file" "ansible_vars" {
  content = templatefile("templates/ansible_vars.tpfl", {
    k3s_version       = "v1.25.7-rc1+k3s1"
    ansible_user      = "ubuntu"
    systemd_dir       = "/etc/systemd/system"
    master_endpoint   = module.ec2_instance[0].private_ip
    kube_api_lb       = module.k8s-lb.lb_dns_nam
    extra_server_args = "--disable=servicelb --tls-san ${module.k8s-lb.lb_dns_name}"
    extra_agent_args  = ""
  })
  filename        = "../ansible/inventory/group_vars/all.yaml"
  file_permission = 0644
}

resource "local_file" "hosts" {
  content = templatefile("templates/hosts.ini.tpfl", {
    master                 = module.ec2_instance[0].public_ip
    additional_controllers = slice(module.ec2_instance, 1, var.num_of_controllers).*.public_ip
    ansible_user           = "ubuntu"
  })
  filename        = "../ansible/inventory/hosts.ini"
  file_permission = 0644
}