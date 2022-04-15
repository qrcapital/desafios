# resource "aws_ecr_repository" "ecr_repo" {
#   name = "metabase/metabase"
# }

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecsLogs"{
  name = "/ecs/ecsLogs"
}

resource "aws_ecs_task_definition" "ecs_task" {
  family = "ecs_service"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
  #task_role_arn            = var.dbRole
  execution_role_arn       = var.ecsRole
  container_definitions = jsonencode([
    {
      name      = "ecs_container"
      image     = "413261057581.dkr.ecr.us-east-1.amazonaws.com/teste" #change
      cpu       = 1024
      memory    = 2048
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
        "awslogs-group": "/ecs/ecsLogs",
        "awslogs-region": var.region,
        "awslogs-stream-prefix": "ecs"
          }
      }
    },
  ])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "ecs_service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1
  launch_type = "FARGATE"

  network_configuration{
    subnets = [var.subnetPrivateA,var.subnetPrivateB]
    security_groups = [var.serviceSg]
  }

  load_balancer {
    target_group_arn = var.tgA
    container_name   = "ecs_container"
    container_port   = 3000
  }
}