resource "aws_ami_from_instance" "cmk_ami" {
  name                    = "${var.name}-ami"
  source_instance_id      = aws_instance.cmk_web.id
  depends_on = [
    aws_instance.cmk_web
  ]
}

resource "aws_launch_configuration" "cmk_lacf" {
  name                 = "${var.name}-web"
  image_id             = aws_ami_from_instance.cmk_ami.id
  instance_type        = var.instance
  iam_instance_profile = "admin1"
  security_groups      = [aws_security_group.cmk_websg.id]
  key_name             = var.key
  user_data            =<<-EOF
                        #!/bin/bash
                        systemctl start httpd
                        systemctl enable httpd
                        EOF
  lifecycle {
    create_before_destroy  = true
  }
}

resource "aws_placement_group" "cmk_pg" {
  name     = "${var.name}-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "cmk_atsg" {
  name                      = "${var.name}-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.cmk_lacf.name
  vpc_zone_identifier       = [aws_subnet.cmk_pub[0].id,aws_subnet.cmk_pub[1].id]
}

resource "aws_autoscaling_attachment" "cmk_atatt" {
  autoscaling_group_name = aws_autoscaling_group.cmk_atsg.id
  alb_target_group_arn   = aws_lb_target_group.cmk_lbtg.arn
}