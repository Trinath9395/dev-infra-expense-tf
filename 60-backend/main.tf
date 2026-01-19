resource "aws_instance" "backend" {
  ami                    = data.aws_ami.joindevops.id
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_sg_id.value]
  subnet_id              = local.private_subnet_id
  instance_type          = "t3.micro"
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-backend"
    }
  )
}

resource "null_resource" "backend" {
  triggers = {
    instance_id = aws_instance.backend.id
  }

  connection {
    host     = aws_instance.backend.private_ip
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
  }

  provisioner "file" {
    source      = "backend.sh"
    destination = "/tmp/backend.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/backend.sh",
      "sudo sh /tmp/backned.sh ${var.environment}"
    ]
  }

}