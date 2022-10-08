data "aws_ami" "ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "main" {
    filter {
        name = 	"tag:Name"
        value = "noaptea-companiilor-vpc"
    }
}

resource "aws_security_group" "sg" {
  name        = "${var.name_prefix}-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.sg_rules
    description      = "Allow http from anywhere"
    from_port        = each.from_port
    to_port          = each.to_port
    protocol         = each.protocol
    cidr_blocks      = each.cidr_blocks
  }


  tags = {
    Name = "${var.name_prefix}-sg"
  }
}


resource "aws_launch_template" "foo" {
  name = "${var.name_prefix}-launch-template"


  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  ebs_optimized = true


  iam_instance_profile {
    name = aws_iam_instance_profile.test_profile.arn
  }

  image_id = data.aws_ami.ami.id




  instance_type = "t2.small"
  key_name = null


  monitoring {
    enabled = true
  }

  vpc_security_group_ids = [aws_security_group.sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      LAUNCH_TEMPLATE = "TRUE"
    }
  }

  user_data = filebase64("${path.module}/user-data.sh" )
}


