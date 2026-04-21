


module "networking" {
  source = "./modules/networking"
}


module "database" {
  source      = "./modules/database"
  vpc_id      = module.networking.vpc_id
  db_subnets  = module.networking.private_subnets
  ecs_sg_id   = module.ecs.ecs_sg_id 
  db_name     = "simpleapi"
  db_user     = "postgres_admin"
  db_password = "SuaSenhaForte123" 
}


module "ecs" {
  source          = "./modules/ecs"
  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnets
  private_subnets = module.networking.private_subnets
  
  container_image = "458580845911.dkr.ecr.us-east-1.amazonaws.com/simple-api-repo:latest"
  
  
  db_host         = module.database.db_address
  db_user         = "postgres_admin"
  db_password     = "SuaSenhaForte123"
  db_name         = "simpleapi"
}