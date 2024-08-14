# Defining the ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-cluster"

  tags = {
    Name = "${var.app_name}-cluster"
  }
}