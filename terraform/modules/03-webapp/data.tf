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
        bucket = var.remote_state_bucket
        key = var.network_remote_state_key
        region = var.region
    }
}

data "aws_vpc" "main" {
 id = data.terraform_remote_state.network.vpc_id
}

output "vpc" {
    value = data.aws_vpc.main.id
}