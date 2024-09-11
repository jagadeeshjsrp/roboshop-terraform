resource "aws_instance" "instance" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = local.name
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = var.app_type == "db" ? local.db_commands : local.app_commands

  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z01821482DK31A4C4NHX5"
  name    = "${var.component_name}-dev.devjsr1.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.instance.private_ip]
}
