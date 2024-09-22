variable "region" {
  description = "The AWS region to deploy in."
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for EC2 instances."
  type        = string
  default     = "ami-XXXXXXXXXXXXXXXXX"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "The username of the database."
  type        = string
  default     = "user1"
}

variable "password" {
  description = "The pass to the database."
  type        = string
  default     = "StrongPassword"
  sensitive   = true
}

variable "email" {
  description = "Email address for notifications and alarms"
  type        = string
  default     = "example@gmail.com"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Tag for AHL"
  type        = string
  default     = "AHL_projects"
}

variable "Owner" {
  description = "owner of the resource"
  type        = string
  default     = "System"
}

variable "Repo" {
  description = "link to code if you need to change"
  type        = string
  default     = "github.com"
}

variable "isdev" {
  description = "Boolian defining DEV/PROD env"
  type        = bool
  default     = true
}

variable "ssh_user" {
  description = "key for ssh into the Ec2 instance"
  type        = string
  default     = "user7"
}

variable "ec2_type" {
  description = "Ec2 instance type"
  type        = string
  default     = "t2.micro"
}
