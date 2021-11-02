resource "aws_placement_group" "cmk_pg" {
  name     = "cmk-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "cmk_atsg" {
  name                      = "cmk-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.cmk_lacf.name
  vpc_zone_identifier       = [aws_subnet.cmk_puba.id,aws_subnet.cmk_pubc.id]
}