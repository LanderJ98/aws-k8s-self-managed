# Introduction

A self managed Kubernetes Cluster built on EC2 instances

Infrastructure resources are deployed using Terraform.
The cluster is bootstrapped using ansible via the Terraform provisioner.

The ansible roles assume your EC2 instances are using Ubuntu.

Terraform generates the ansible variable and host files.

## Dependencies needed

1. Terraform >= 1.3.x
2. Ansible >= 2.14.x and Python >= 3.9

## Get your kubeconfig

```shell
scp ubuntu@<master-node-ip>:/home/ubuntu/.kube/config ~/.kube/config
```

where the master node ip is the master-controller from the terraform output. Then edit the file and change the server ip to the load balancer dns terraform output
