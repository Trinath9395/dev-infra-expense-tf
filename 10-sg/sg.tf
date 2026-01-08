module "mysql_sg" {
  source = "../terraform-sg-module"
  project_name = var.project_name
  environment = var.environment
  sg_name = "mysql"
  common_tags = var.common_tags
  sg_description = "Created for MySQL instances in expense"
  vpc_id = data.aws_ssm_parameter.vpc_id.value

}