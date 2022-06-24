/*
resource "aws_instance" "demo_ec2" {
  # ami           = "ami-079b5e5b3971bd10d"
  ami = data.aws_ami.amz-2.id
  instance_type = "t3.micro"
  key_name = data.aws_key_pair.demo_key.key_name
  tags = {
    Name = "demo_ec2"
  }
  # security_groups = [ "${aws_security_group.ec2_sg.id}" ]
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}" ]
}


output "pub-key" {
  value = aws_instance.demo_ec2.public_ip
}


resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow ssh and HTTP inbound traffic"
  # vpc_id      = aws_vpc.demo_vpc.id

 ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = [ "0.0.0.0/0" ]
   ipv6_cidr_blocks = [ "::/0" ]
 }

 ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = [ "0.0.0.0/0" ]
   ipv6_cidr_blocks = [ "::/0" ]
 }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

  tags = {
    Name = "ec2_sg"
  }

}
*/