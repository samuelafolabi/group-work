resource "aws_lb_target_group" "main" {
  name        = "${var.app_name}-tg"
  port        = "80"
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.app_name}-tg"
  }
}