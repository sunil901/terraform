## Application target group
resource "aws_lb_target_group" "my-target-group-009" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }

  name        = "my-test-terraform-tg-009"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.custom-vpc-terraform.id

}
