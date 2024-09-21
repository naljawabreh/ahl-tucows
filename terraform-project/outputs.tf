output "db_instance_endpoint" {
  value = module.rds_mysql.db_instance_endpoint
}

output "db_instance_id" {
  value = module.rds_mysql.db_instance_identifier
}

output "vpc_id" {
  value = aws_vpc.app_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}
