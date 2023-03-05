# Introduction

A self managed Kubernetes Cluster built on EC2 instances

Infrastructure resources are deployed using Terraform.
The cluster is bootstrapped using ansible via the Terraform provisioner.

The ansible roles assume your EC2 instances are using Ubuntu.

Terraform generates the ansible variable and host files.

## Dependencies needed

1. Terraform >= 1.3.x
2. Ansible >= 2.14.x and Python >= 3.9
