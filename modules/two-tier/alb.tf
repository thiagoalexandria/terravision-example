resource "aws_lb" "nginx" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = var.subnet_list

  tags = var.tags
}

resource "aws_lb_target_group" "nginx" {
  name     = format("%s-tg", var.alb_name)
  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {
    path = "/"
    port = 80
  }

  tags = var.tags
}

resource "aws_lb_target_group_attachment" "name" {
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.webserver.id
  port             = 80
}

resource "aws_lb_listener" "name" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }
}