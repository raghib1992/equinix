resource "aws_autoscaling_group" "demo_asg" {
  name                      = "foobar3-terraform-test"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 60
  health_check_type         = "ELB"
  desired_capacity          = 1
  target_group_arns         = ["${aws_lb_target_group.demo_tg.arn}"]
#   force_delete              = true
#   placement_group           = aws_placement_group.test.id
#   launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier       = [aws_subnet.az-1-pub-subnet.id, aws_subnet.az-2-pub-subnet.id]

  launch_template {
    id      = aws_launch_template.demo_lt.id
    version = "$Latest"
  }

#   initial_lifecycle_hook {
#     name                 = "foobar"
#     default_result       = "CONTINUE"
#     heartbeat_timeout    = 2000
#     lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

#     notification_metadata = <<EOF
# {
#   "foo": "bar"
# }
# EOF

#     notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
#     role_arn                = "arn:aws:iam::123456789012:role/S3Access"
#   }

#   tag {
#     key                 = "foo"
#     value               = "bar"
#     propagate_at_launch = true
#   }

#   timeouts {
#     delete = "15m"
#   }

#   tag {
#     key                 = "lorem"
#     value               = "ipsum"
#     propagate_at_launch = false
#   }
}

# resource "aws_autoscaling_attachment" "demo_asg_attachment" {
#   autoscaling_group_name = aws_autoscaling_group.demo_asg.id
#   lb_target_group_arn    = aws_lb_target_group.demo_tg.arn
# }