resource "aws_vpc" "demo_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true #gives you an internal domain name
    enable_dns_hostnames = true #gives you an internal host name
    enable_classiclink = false
    instance_tenancy = "default"    
    tags = {
        Name = "demo_vpc"
    }
}



resource "aws_subnet" "az-1-pub-subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.0.0/20"
    map_public_ip_on_launch = true //it makes this a public subnet
    availability_zone = "${var.AWS-REGION}a"
    tags = {
        Name = "az-1-pub-subnet"
    }
}

resource "aws_subnet" "az-1-pri-subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.32.0/20"
    map_public_ip_on_launch = false //it makes this a pivate subnet
    availability_zone = "${var.AWS-REGION}a"
    tags = {
        Name = "az-1-pri-subnet"
    }
}


resource "aws_subnet" "az-2-pub-subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.64.0/20"
    map_public_ip_on_launch = true //it makes this a public subnet
    availability_zone = "${var.AWS-REGION}b"
    tags = {
        Name = "az-2-pub-subnet"
    }
}

resource "aws_subnet" "az-2-pri-subnet" {
    vpc_id = aws_vpc.demo_vpc.id
    cidr_block = "10.0.96.0/20"
    map_public_ip_on_launch = false //it makes this a pivate subnet
    availability_zone = "${var.AWS-REGION}b"
    tags = {
        Name = "az-2-pri-subnet"
    }
}

resource "aws_internet_gateway" "demo_igw" {
    vpc_id = aws_vpc.demo_vpc.id
    tags = {
        Name = "demo_igw"
    }
}

resource "aws_route_table" "demo_rt" {
  vpc_id = aws_vpc.demo_vpc.id
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demo_igw.id}"
  }
  tags = {
    Name = "demo_rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.az-1-pub-subnet.id
  route_table_id = aws_route_table.demo_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.az-2-pub-subnet.id
  route_table_id = aws_route_table.demo_rt.id
}