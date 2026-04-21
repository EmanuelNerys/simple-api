resource "aws_ecr_repository" "api_repo" {
  name                 = "simple-api-repo"
  force_delete         = true # Facilita se precisar apagar depois
}

output "ecr_url" {
  value = aws_ecr_repository.api_repo.repository_url
}