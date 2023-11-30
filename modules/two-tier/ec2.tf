resource "aws_instance" "webserver" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  security_groups      = [aws_security_group.allow_http.id]
  iam_instance_profile = var.iam_instance_profile

  user_data = file("${path.module}/script.sh")

  tags = var.tags
}


resource "aws_security_group" "allow_http" {
  name        = format("%s-allow_http", var.alb_name)
  description = "Allow http inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
}