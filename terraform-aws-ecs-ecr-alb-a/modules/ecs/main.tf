resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
  tags = { Name = var.cluster_name }
}

data "template_file" "container_definitions" {
  template = file("${path.module}/container-definitions.json.tpl")
  vars = {
    name           = var.project
    cpu            = var.cpu
    memory         = var.memory
    container_port = tostring(var.container_port)
    ecr_image      = "${var.ecr_repo_url}:${var.image_tag}"
    log_group      = "/ecs/${var.project}"
    aws_region     = var.aws_region
  }
}

resource "aws_cloudwatch_log_group" "ecs" {
  name = "/ecs/${var.project}"
  retention_in_days = 14
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.project
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.task_exec_role_arn

  container_definitions = data.template_file.container_definitions.rendered
  tags = { Name = "${var.project}-task" }
}

resource "aws_ecs_service" "this" {
  name            = "${var.project}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.private_subnet_ids
    security_groups = [var.ecs_sg_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.project
    container_port   = var.container_port
  }

  depends_on = [var.alb_target_group_arn]
}
