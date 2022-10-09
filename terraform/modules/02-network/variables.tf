variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "name_prefix" { 
    default = "noaptea-companiilor"
}

variable "number_of_subnets" { 
    default = 4 
}

variable "number_public_subnets" { 
    default = 2
}

variable "number_private_subnets" { 
    default = 2
}

variable "map_az" {
    default = ["a","b","c","d"]
}