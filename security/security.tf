resource "aws_security_group" "albSg" {
  name        = "albSg"
  description = "Allow internet inbound traffic"
  vpc_id      = var.vpc

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "albSg"
  }
}

resource "aws_security_group" "serviceSg" {
  name        = "serviceSg"
  description = "Allow albSg inbound traffic"
  vpc_id      = var.vpc
    #test
    ingress {
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      security_groups = ["${aws_security_group.albSg.id}"]
    }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "serviceSg"
  }
}

resource "aws_security_group" "databaseSg" {
  name        = "databaseSg"
  description = "Allow serviceSg inbound traffic"
  vpc_id      = var.vpc
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = ["${aws_security_group.serviceSg.id}"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "databaseSg"
  }
}

