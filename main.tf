# rstudio server
resource "aws_instance" "rstudio" {
  ami = var.ami

  # free tier eligible
  instance_type = "${var.instance_type}"

  # list of security groups for the instance
  security_groups = [
    "${aws_security_group.rstudio_connect_security_group.name}",
  ]

  availability_zone = "${var.zone}"

  key_name = "${var.keypair_name}"

  # add a public IP address
  associate_public_ip_address = true

  
  tags = {
    Name = "Rstudio Connect"
  }

root_block_device {
    volume_size           = "${var.disk_size}"
    volume_type           = "standard"
    delete_on_termination = "${var.keep_data}"
  }

  provisioner "file" {
    connection {
      host        = "${aws_instance.rstudio.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file(var.private_key)}"
    }

    source      = "./Rstudio_connect_installation.sh"
    destination = "/tmp/Rstudio_connect_installation.sh"
  }

  provisioner "remote-exec" {
    connection {
      host        = "${aws_instance.rstudio.public_ip}"
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file(var.private_key)}"
    }

    inline = [
      "sudo sh /tmp/Rstudio_connect_installation.sh",
    ]
  }
}

resource "aws_eip" "rstudio_eip" {
  instance = "${aws_instance.rstudio.id}"
}