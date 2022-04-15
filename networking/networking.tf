resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnetPublicA.id

  tags = {
    Name = "nat"
  }
  depends_on = [aws_internet_gateway.igw, aws_subnet.subnetPublicA]
}


resource "aws_route_table" "publicRtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "publicRtb"
  }
}

resource "aws_route_table" "privateRtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "privateRtb"
  }
}

resource "aws_subnet" "subnetPublicA" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "subnetPublicA"
  }
}

resource "aws_subnet" "subnetPublicB" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "subnetPublicB"
  }
}

resource "aws_subnet" "subnetPrivateA" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.11.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "subnetPrivateA"
  }
}

resource "aws_subnet" "subnetPrivateB" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.12.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "subnetPrivateB"
  }
}

resource "aws_route_table_association" "associationPublicA" {
  subnet_id      = aws_subnet.subnetPublicA.id
  route_table_id = aws_route_table.publicRtb.id
}

resource "aws_route_table_association" "associationPublicB" {
  subnet_id      = aws_subnet.subnetPublicB.id
  route_table_id = aws_route_table.publicRtb.id
}

resource "aws_route_table_association" "associationPrivateA" {
  subnet_id      = aws_subnet.subnetPrivateA.id
  route_table_id = aws_route_table.privateRtb.id
}

resource "aws_route_table_association" "associationPrivateB" {
  subnet_id      = aws_subnet.subnetPrivateB.id
  route_table_id = aws_route_table.privateRtb.id
}

