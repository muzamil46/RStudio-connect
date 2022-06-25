output "rstudio_Public_IP" {
  value = "${aws_eip.rstudio_eip.public_ip}"
}

output "rstudio_DNS" {
  value = "${aws_instance.rstudio.public_dns}"
}

output "rstudio-ssh-command" {
  value = "ssh -i ${var.private_key} ec2-user@${aws_eip.rstudio_eip.public_ip}"
}