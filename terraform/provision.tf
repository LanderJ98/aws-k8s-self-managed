resource "null_resource" "provision_cluster" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    working_dir = "../ansible"
    command     = "ansible-playbook bootstrap.yaml"
  }
  depends_on = [
    local_file.ansible_vars, local_file.hosts
  ]
}