resource "aws_lb" "this" {
  name            = "Terraform-ALB"
  security_groups = [aws_security_group.alb.id]
  subnets         = [aws_subnet.this["pub_a"].id, aws_subnet.this["pub_b"].id]

  tags = merge(local.common_tags, { Name = "Terraform ALB" })
}

resource "aws_lb_target_group" "this" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id

  health_check {
    path              = "/" # "/" significa que será setado na raiz
    healthy_threshold = 2
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward" # esse type significa encaminhar a requisição para targer group
    target_group_arn = aws_lb_target_group.this.arn
  }
}