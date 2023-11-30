# Configure the AWS Provider
provider "aws" {
  region = "sa-east-1"
}

module "two_tier_application" {
  source = "./modules/two-tier"

  ami_id               = data.aws_ami.amazon_linux.id
  subnet_id            = data.aws_subnet.pub1.id
  iam_instance_profile = "Ec2RoleSSM"
  vpc_id               = data.aws_subnet.pub1.vpc_id
  subnet_list          = [data.aws_subnet.pub1.id, data.aws_subnet.pub2.id]
  alb_name             = "lab-nginx"

  tags = {
    environment = "dev"
    owner       = "cloud"
  }
}

module "app2_two_tier_application" {
  source = "./modules/two-tier"

  ami_id               = data.aws_ami.amazon_linux.id
  subnet_id            = data.aws_subnet.pub1.id
  iam_instance_profile = "Ec2RoleSSM"
  vpc_id               = data.aws_subnet.pub1.vpc_id
  subnet_list          = [data.aws_subnet.pub1.id, data.aws_subnet.pub2.id]
  alb_name             = "livelo-dev-app"

  tags = {
    environment = "dev"
    owner       = "cloud"
  }
}