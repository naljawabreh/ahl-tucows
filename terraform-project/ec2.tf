# API Server (Web Server)
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"

  name                   = "${local.name_prefix}-API Server"
  instance_type          = var.ec2_type
  key_name               = var.ssh_user
  ami                    = var.ami
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.public_subnet.id

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = local.common_tags
}
