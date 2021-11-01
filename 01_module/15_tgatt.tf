resource "aws_lb_target_group_attachment" "cmk_lbtg_att" {
  target_group_arn      = aws_lb_target_group.cmk_lbtg.arn
  target_id             = aws_instance.cmk_weba.id
  port                  = 80 
}