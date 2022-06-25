resource "aws_security_group" "rstudio_connect_security_group" {
  name        = "rstudio_connect_security_group"
  description = "access to the RStudio connect server"
}

# allow traffic from the internet to the RStudio connect server 
resource "aws_security_group_rule" "ingress_rstudio" {
  security_group_id = "${aws_security_group.rstudio_connect_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 3939
  to_port           = 3939
}

# allow http access on port 22 from our ip address
resource "aws_security_group_rule" "ingress_ssh" {
  security_group_id = "${aws_security_group.rstudio_connect_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

# allow reply traffic from the server to the internet on ephemeral ports
resource "aws_security_group_rule" "egress_reply" {
  security_group_id = "${aws_security_group.rstudio_connect_security_group.id}"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "all"
  from_port         = 0
  to_port           = 0
}