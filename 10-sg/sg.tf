module "mysql_sg" {
  source         = "git::https://github.com/Trinath9395/terraform-sg-module.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "mysql"
  common_tags    = var.common_tags
  sg_description = "Created for MySQL instances in expense"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "backend_sg" {
  source         = "git::https://github.com/Trinath9395/terraform-sg-module.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "backend"
  common_tags    = var.common_tags
  sg_description = "Created for Backend instances in expense"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "frontend_sg" {
  source         = "git::https://github.com/Trinath9395/terraform-sg-module.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "frontend"
  common_tags    = var.common_tags
  sg_description = "Created for frontend instances in expense"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}

module "bastion_sg" {
  source         = "git::https://github.com/Trinath9395/terraform-sg-module.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "bastion"
  common_tags    = var.common_tags
  sg_description = "Created for bastion instances in expense"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
}