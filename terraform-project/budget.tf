# AWS Budget
resource "aws_budgets_budget" "monthly_budget" {
  name         = "${local.name_prefix}-monthly-budget"
  budget_type  = "COST"
  limit_amount = "250"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  # Notification when usage exceeds 80%
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = "80"
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = [var.email]
  }

  tags = local.common_tags
}
