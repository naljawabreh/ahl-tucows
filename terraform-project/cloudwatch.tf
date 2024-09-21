# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "high_api_cpu_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  actions_enabled     = true
  alarm_actions       = [aws_sns_topic.alarm_topic.arn]
  dimensions = {
    InstanceId = module.ec2_instance.id
  }
  tags = local.common_tags
}

resource "aws_sns_topic" "alarm_topic" {
  name = "ec2-high-cpu"
}

resource "aws_sns_topic_subscription" "alarm_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email
}
