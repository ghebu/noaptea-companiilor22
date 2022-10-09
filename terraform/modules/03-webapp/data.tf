# data "aws_ami" "ami" {
#   most_recent = true
#   owners      = ["137112412989"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-kernel-5.10-hvm-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

data "terraform_remote_state" "network" {
    backend = "s3"
    config = {
        bucket = var.network_remote_state_bucket
        key = var.network_remote_state_key
        region = var.region
    }
}

output "vpc" {
    value = data.terraform_remote_state.network.outputs.vpc_id
}