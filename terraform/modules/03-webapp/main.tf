resource "aws_autoscaling_group" "asg" {
  name               = "${var.name_prefix}-asg"
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  vpc_zone_identifier = data.terraform_remote_state.network.outputs.private_subnets

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
  tags  = {
    Name = "${var.name_prefix}-asg"
  }
}