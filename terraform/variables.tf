variable "vpc_name" {
  type    = string
  default = "k8s-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "num_of_controllers" {
  type    = number
  default = 2
}

variable "num_of_workers" {
  type    = number
  default = 3
}

variable "worker_sg_name" {
  type = string
  default = "workers-sg"
}

variable "ami_id" {
  type    = string
  default = "ami-0aaa5410833273cfe"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "controller_sg_name" {
  type    = string
  default = "k8s-controllers"
}

variable "cidr_blocks" {
  type    = string
  default = "86.20.112.87/32,10.0.0.0/16"
}

variable "kube_api_port" {
  type    = number
  default = 6443
}

variable "ssh_key_name" {
  type    = string
  default = "jl-ee-mbp"
}

variable "http_port" {
  type = number
  default = 80
}

variable "https_port" {
  type = number
  default = 443
}