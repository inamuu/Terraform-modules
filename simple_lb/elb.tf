resource "aws_lb" "staging-inamuu" {
  name                       = "staging-inamuu"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = ["aws_security_group.staging-inamuu-alb.id"]
  subnets                    = ["aws_subnet.staging-public-1a.id"]
  enable_deletion_protection = true

  tags {
    Env = "staging"
  }
}

resource "aws_lb_target_group" "staging-inamuu" {
  name                 = "staging-inamuu-lb-tg"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = aws_vpc.staging-inamuu-vpc.id
  target_type          = "ip"
  deregistration_delay = "10"

  health_check {
    protocol            = "HTTP"
    path                = "/ping"
    port                = 80
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = 200
  }
}

resource "aws_alb_listener" "staging-inamuu" {
  load_balancer_arn = aws_lb.staging-inamuu.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "staging-inamuu-https" {
  load_balancer_arn = aws_lb.staging-inamuu.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  certificate_arn   = aws_acm_certificate.staging-inamuu-com.arn

  default_action {
    target_group_arn = aws_lb_target_group.staging-inamuu.arn
    type             = "forward"
  }
}
