resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.albSg]
  subnets            = [var.subnetPublicA, var.subnetPublicB]
}

resource "aws_lb_target_group" "tgA" {
  name        = "tgA"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc
}

resource "aws_lb_listener" "albListener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.tgA.arn
  }
}

