variable "instance_profile_name" {
    default = "SSMRole4EC2"
}

variable "sg_ingress_rules" { 
    map = {
        from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = "0.0.0.0/0"}
}
