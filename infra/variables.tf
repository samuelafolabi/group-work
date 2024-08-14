variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "eu-west-2"
}

variable "app_name" {
  description = "The name of the application"
  default     = "pizza-order-app"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "az_1" {
  description = "Number of AZs to cover in a given region"
  default     = "eu-west-2a"
}

variable "az_2" {
  description = "Number of AZs to cover in a given region"
  default     = "eu-west-2b"
}

variable "ecs_task_desired_count" {
  description = "Number of desired instances"
  type        = number
  default     = 2
}

variable "ecs_task_deployment_minimum_healthy_percent" {
  description = "How many percent of a service must be running to still execute a safe deployment"
  type        = number
  default     = 50
}

variable "ecs_task_deployment_maximum_percent" {
  description = "How many additional tasks are allowed to run (in percent) while a deployment is executed"
  type        = number
  default     = 200
}