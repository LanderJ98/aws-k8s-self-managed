variable "lb_name" {
  type        = string
  description = "description"
}

variable "lb_subnet_ids" {
  type = list(string)
}

variable "https_enabled" {
  type = bool
}

variable "http_port" {
  type = number
}

variable "https_port" {
  type = number
  default = null
}

variable "load_balancer_type" {
  type = string
  default = "network"
}

variable "http_target_group_name" {
  type    = string
}

variable "https_target_group_name" {
  type    = string
  default = null
}

variable "vpc_id" {
  type = string
}