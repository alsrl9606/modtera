# Application LoadBalancer Deploy
resource "aws_lb" "cmk_lb" {
  name                   = "cmk-alb"
  internal               = false
  load_balancer_type     = "application"
  security_groups        =  [aws_security_group.cmk_websg.id]
  subnets                =  [aws_subnet.cmk_puba.id,aws_subnet.cmk_pubc.id]
  
  tags = {
    Name  = "cmk-alb"
  }
}