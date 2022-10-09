resource "aws_autoscaling_group" "asg" {
  
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  vpc_zone_identifier = [
        data.terraform_remote_state.network.outputs.prv_subnets_id[0],
        data.terraform_remote_state.network.outputs.prv_subnets_id[1]
    ]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}