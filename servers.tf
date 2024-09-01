data "aws_ami" "centos" {
  owners           = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "instance_type" {
  default = "t3.small"
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "frontend-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "mongodb-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "catalogue-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "redis-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "user-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "cart-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.cart.private_ip]
}
resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "mysql-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "shipping-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "rabbitmq-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["data.aws_security_group.allow-all.id"]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "payment-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.payment.private_ip]
}







