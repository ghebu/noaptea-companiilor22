variable "instance_profile_name" {
    default = "SSMRole4EC2"
}

variable "sg_ingress_rules" {
  description = "List of sg_ingress_rules"
  default = null 
}

variable "name_prefix" { 
    default = "noaptea-companiilor"
}

variable "vpc_name" { 
    default = "noaptea-companiilor-vpc"
}

variable "remote_state_bucket" {

}
variable "network_remote_state_key" {
    default = "02-network.tfstate"
}
variable "region" {
    default = "us-east-1"
}