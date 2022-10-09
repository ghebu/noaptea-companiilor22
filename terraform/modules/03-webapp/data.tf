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

data "aws_vpc" "main" {
    filter {
        name = 	"tag:Name"
        values = ["noaptea-companiilor-vpc"]
    }
}

output "vpc" {
    value = data.aws_vpc.main.id
}