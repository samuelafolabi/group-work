# Defining the ECS Service running on Fargate
resource "aws_ecs_service" "main" {
  name                               = "${var.app_name}-service"
  launch_type                        = "FARGATE"
  platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.main.arn
  scheduling_strategy                = "REPLICA"
  desired_count                      = var.ecs_task_desired_count
  deployment_minimum_healthy_percent = var.ecs_task_deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.ecs_task_deployment_maximum_percent
  depends_on                         = [aws_alb_listener.main, aws_iam_role.iam-role]

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "${var.app_name}-container"
    container_port   = 80
  }

  network_configuration {
    assign_public_ip = true
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
    security_groups  = [aws_security_group.main.id]
  }
}