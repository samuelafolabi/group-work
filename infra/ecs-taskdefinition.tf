
resource "aws_cloudwatch_log_group" "app_log_group" {
  count = data.aws_cloudwatch_log_group.existing_log_group.id == "" ? 1 : 0
  name              = "${var.app_name}-logs"
  retention_in_days = 7  # Set this to your desired retention period
}


resource "aws_ecs_task_definition" "main" {
  family                   = "${var.app_name}-td"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048
  container_definitions    = jsonencode([
    {
      name         = "${var.app_name}-container"
      image        = "${aws_ecr_repository.ecr_repo.repository_url}:latest"
      cpu          = 1024
      memory       = 2048
      essential    = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options   = {
          awslogs-group         = aws_cloudwatch_log_group.app_log_group.name
          awslogs-region        = "eu-west-2"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}


data "aws_ecs_task_definition" "main" {
  task_definition = aws_ecs_task_definition.main.family
}