variable "name" {}
variable "aws_ami" {
  default     = "ami-0eff9baf4d268050e"
}
variable "account" {}
variable "private_subnet_ids" {}
variable "public_subnet_ids" {}
variable "vpc_id" {}

variable "instance_count" {}

variable "instance_type" {
   description = "EC2 instance type to use for the argo EC2 instances."
   default     = "t3.medium"
 }

variable "tags" {
   default = {}
 }