# Application LoadBalancer Deploy
resource "aws_lb" "cmk_lb" {
 
  name                   = "${var.name}-alb"
  internal               = false
  load_balancer_type     = var.lb_type
  security_groups        =  [aws_security_group.cmk_websg.id]
  subnets                =  [aws_subnet.cmk_pub[0].id,aws_subnet.cmk_pub[1].id]
  
  tags = {
    Name  = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "cmk_lbtg" {
  name      = "${var.name}-lbtg"
  port      =  var.http_port
  protocol  =  var.prot-lbtg
  vpc_id    =  aws_vpc.cmk_vpc.id

  health_check {
    enabled               = true
    healthy_threshold     = 3
    interval              = 5
    matcher               = "200"
    path                  = "/health.html" 
    port                  = "traffic-port"
    protocol              = var.prot-lbtg
    timeout               = 2
    unhealthy_threshold   = 2 
  }
}

resource "aws_lb_listener" "cmk_lblist" {
  load_balancer_arn       = aws_lb.cmk_lb.arn
  port                    = var.http_port
  protocol                = var.prot-lbtg

  default_action {
    type                  = "forward"
    target_group_arn      = aws_lb_target_group.cmk_lbtg.arn  
  }
}

resource "aws_lb_target_group_attachment" "cmk_lbtg_att" {
  target_group_arn      = aws_lb_target_group.cmk_lbtg.arn
  target_id             = aws_instance.cmk_web.id
  port                  = var.http_port
}