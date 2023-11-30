variable "ami_id" {
  type        = string
  description = "aws ec2 instance ami id"
}

variable "instance_type" {
  type        = string
  description = "aws ec2 instance type"
  default     = "t3a.large"
}

variable "subnet_id" {
  type        = string
  description = "aws ec2 subnet id"
}

variable "iam_instance_profile" {
  type        = string
  description = "aws ec2 iam role to use with ec2"
}

variable "vpc_id" {
  type        = string
  description = "aws vpc id"
}

variable "tags" {
  type        = map(string)
  description = "aws default tags"
}

variable "subnet_list" {
  type        = list(string)
  description = "aws subnet list to use with alb"
}

variable "alb_name" {
  type        = string
  description = "aws alb name"
}