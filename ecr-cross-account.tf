variable "source_account_id" {
  description = "Source AWS Account ID"
  type        = string
}

variable "target_account_id" {
  description = "Target AWS Account ID"
  type        = string
}

# ECR Repository in target account
resource "aws_ecr_repository" "app_repo" {
  name = "grp1-coaching18-app"
}

# Cross-account role in target account
resource "aws_iam_role" "ecr_push_role" {
  name = "ECRPushRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.source_account_id}:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach ECR permissions to role
resource "aws_iam_role_policy_attachment" "ecr_push_policy" {
  role       = aws_iam_role.ecr_push_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

# Output the role ARN
output "cross_account_role_arn" {
  value = aws_iam_role.ecr_push_role.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}