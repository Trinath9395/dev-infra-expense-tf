locals {
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  app_alb_sg_id      = "/${var.project_name}/${var.environment}/app_alb_sg_id"
}