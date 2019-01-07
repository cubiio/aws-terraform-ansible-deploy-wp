variable "aws_region" {}
variable "aws_profile" {}
variable "vpc_cidr" {}

data "aws_availability_zones" "available" {}

variable "cidrs" {
  type = "map"
}

variable "localip" {}

variable "domain_name" {}

variable "db_instance_class" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}

variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_interval" {}

variable "key_name" {}
variable "dev_instance_type" {}
variable "dev_ami" {}
variable "public_key_path" {}

# launch config
variable "lc_instance_type" {}

# asg
variable "asg_max" {}

variable "asg_min" {}
variable "asg_grace" {}
variable "asg_hct" {}
variable "asg_cap" {}

# route 53
variable "delegation_set" {}
