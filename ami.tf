data "aws_ami" "amz-2" {
  # executable_users = ["self"]
  most_recent      = true
  name_regex       = "amzn2-ami-*"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}