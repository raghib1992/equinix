resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow HTTPS and HTTP inbound traffic"
  vpc_id      = aws_vpc.demo_vpc.id

 ingress {
   from_port = 443
   to_port = 443
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
    Name = "demo_sg"
  }

}


resource "aws_security_group" "demo_sg_jenkins" {
  name        = "demo_sg_jenkins"
  description = "Allow port 8080 to all"
  vpc_id      = aws_vpc.demo_vpc.id

 ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = [ "0.0.0.0/0" ]
   ipv6_cidr_blocks = [ "::/0" ]
 }

 ingress {
   from_port = 22
   to_port = 22
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
    Name = "demo_sg_jenkins"
  }

}