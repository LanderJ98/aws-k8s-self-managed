variable "lb_name" {
  type        = string
  default     = "k8s-lb"
  description = "description"
}

variable "lb_subnet_ids" {
  type = list(string)
}

variable "k8s_target_group_name" {
  type    = string
  default = "Kube-api-server-tg"
}

variable "vpc_id" {
  type = string
}