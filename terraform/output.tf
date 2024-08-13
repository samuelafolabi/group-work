output "lb_dns_name" {
  value = aws_lb.main.dns_name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
  description = "The URL of the ECR repository"
}

output "ecr_repository_name" {
  value = aws_ecr_repository.ecr_repo.name
  description = "The name of the ECR repository"
}