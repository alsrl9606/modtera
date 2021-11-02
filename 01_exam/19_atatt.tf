resource "aws_autoscaling_attachment" "cmk_atattch" {
  autoscaling_group_name = aws_autoscaling_group.cmk_atsg.id
  alb_target_group_arn = aws_lb_target_group.cmk_lbtg.arn 
}