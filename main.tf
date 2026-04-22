terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Altere se estiver usando outra região
}

module "networking" {
  source = "./modules/networking"
}

module "ecr" {
  source = "./modules/ecr"
}

module "database" {
  source             = "./modules/database"
  vpc_id             = module.networking.vpc_id
  private_subnets_ids = module.networking.private_subnets
}

module "ecs" {
  source          = "./modules/ecs"
  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnets
  repository_url  = module.ecr.repository_url
}

module "pipeline" {
  source             = "./modules/pipeline"
  ecr_repository_url = module.ecr.repository_url
  ecs_cluster_name   = module.ecs.cluster_name
  ecs_service_name   = module.ecs.service_name
}