variable "AWS-REGION" {    
    default = "ap-south-1"
}

variable "PROFILE" {
  default = "sankalan"
}

variable "alb_listener_port" {
  default = 80
}

variable "alb_listener_protocol" {
  default = "HTTP"
}