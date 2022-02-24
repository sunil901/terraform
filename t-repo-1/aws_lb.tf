#Application loadbalancer

resource "aws_lb" "Web_app_lb" {
  name               = "web-app-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.custom-vpc-security-group.id]
  #subnets            = [for subnet in aws_subnet.custom-vpc-public-subnet-one : subnet.id]
  subnets = [
    aws_subnet.custom-vpc-public-subnet-one.id,
    aws_subnet.custom-vpc-public-subnet-two.id,
  ]
  #subnets            = [
  #"$var.custom-vpc-public-subnet-one.id",
  #"$var.custom-vpc-public-subnet-two.id",
  #]

  enable_deletion_protection = false

  tags = {
    Environment = "PROD"
  }

  ip_address_type = "ipv4"

}
