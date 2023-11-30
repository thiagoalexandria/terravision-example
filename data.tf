data "aws_subnet" "pub1" {
  filter {
    name   = "tag:Name"
    values = ["dev-private-subnet-az1"]
  }
}
data "aws_subnet" "pub2" {
  filter {
    name   = "tag:Name"
    values = ["dev-private-subnet-az2"]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}