data "template_file" "demo_file" {
  template = <<EOF
#!/bin/bash -xe
yum install -y wget httpd
echo "Awesome Raghib" > /var/www/html/index.html
echo "health check" > /var/www/html/health.html
# wget -O /etc/yum.repos.d/jenkins.repo \
#     https://pkg.jenkins.io/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# yum upgrade -y
# # Add required dependencies for the jenkins package
# yum install java-11-openjdk -y 
# yum install jenkins -y
systemctl start httpd
systemctl enable httpd
EOF
}

resource "aws_launch_template" "demo_lt" {
  name = "demo_lt"
#   disable_api_termination = true
#   iam_instance_profile {
#     name = "profile-1"
#   }
  image_id = data.aws_ami.amz-2.id
#   instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.demo_key.key_name
  vpc_security_group_ids = ["${aws_security_group.demo_sg_jenkins.id}"]

  user_data = "${base64encode(data.template_file.demo_file.rendered)}"
}
