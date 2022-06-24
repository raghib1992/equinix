resource "aws_lb_target_group" "demo_tg" {
  name         = "demo-tg"
  port         = 80
  protocol     = "HTTP"
  target_type  = "instance"
  vpc_id       = aws_vpc.demo_vpc.id
  health_check {
    unhealthy_threshold = 3
    healthy_threshold   = 3
    interval            = 60
    # min value 5 sec and max value 300 sec 
    # application Load Balancers, the range is 2 to 120 seconds, and the default is 5 seconds
    timeout  = 5
    protocol = "HTTP"
    path     = "/health.html"
    matcher  = "200"
  }
  tags = {
    Name = "demo_tg"
  }
}


resource "aws_lb" "demo_alb" {
  name               = "demo-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo_sg.id]
  subnets            = ["${aws_subnet.az-1-pub-subnet.id}","${aws_subnet.az-2-pub-subnet.id}"]
  # subnet_mapping {
  #   subnet_id =
  #   # allocation_id = 
  # }

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.demo_bucket.bucket
  #   prefix  = "demo-logs"
  #   enabled = true
  # }

  tags = {
    Name  = "demo_alb"
  }
}

resource "aws_lb_listener" "demo_alb_listener" {  
  load_balancer_arn = "${aws_lb.demo_alb.arn}"  
  port              = "${var.alb_listener_port}"  
  protocol          = "${var.alb_listener_protocol}"
  
  default_action {    
    target_group_arn = "${aws_lb_target_group.demo_tg.arn}"
    type             = "forward"  
  }
}