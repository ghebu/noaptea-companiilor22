variable "instance_profile_name" {
    default = "SSMRole4EC2"
}

# variable "sg_ingress_rules" {
#   type = list(object({
#     from_port = number
#     to_port = number
#     protocol = string
#   }))

#   default = [
#     {
#       from_port = 80
#       to_port = 80
#       protocol = "tcp"
      
#     },
#     {
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#     }
#   ]
# }

variable "name_prefix" { 
    default = "noaptea-companiilor"
}