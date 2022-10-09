
resource "aws_security_group" "sg" {
  name        = "${var.name_prefix}-sg"
  description = "Allow inbound traffic"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

    dynamic "ingress" {
        for_each = var.sg_ingress_rules
        content {
                from_port        = ingress.value.from_port
                to_port          = ingress.value.to_port
                protocol         = ingress.value.protocol
                cidr_blocks      = ["0.0.0.0/0"]
        }
    }

  tags = {
    Name = "${var.name_prefix}-sg"
  }
}


resource "aws_launch_template" "launch_template" {
  name = "${var.name_prefix}-launch-template"


  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  ebs_optimized = true


  iam_instance_profile {
    name = aws_iam_instance_profile.test_profile.arn
  }

  image_id = var.ami_id



  instance_type = var.instance_type
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

  user_data = filebase64("${path.module}/user-data.sh")
}


