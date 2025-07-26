# ECR Repository
resource "aws_ecr_repository" "app_repo" {
  name = "grp1-coaching18-app"
}

# Output the repository URL
output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}