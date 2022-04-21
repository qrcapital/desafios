#importando de variables.tf
provider "aws" {
    region = var.region
}

#Usando das melhores práticas, salva o estado do terraform num s3 remoto, 
# necessita a criação do s3 previamente.
# terraform {
#     backend "s3" {
#         key = "terraform/tfstate.tfstate"
#         bucket = "remote-backend"
#         region = var.region
#         access_key = "xxx"
#         secret_key = "xxx"
#     }
# }

#Módulo para criação de Policy e Role IAM para o Service ECS
module "iam" {
    source = "./iam"
}


#Módulo para criação de VPCs, Subnets, Internet Gateway, NAT e route tables
module "networking" {
  #importando variáveis
  source               = "./networking"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidr_a = "10.1.1.0/24"
  public_subnet_cidr_b = "10.1.2.0/24"
  private_subnet_cidr_a = "10.1.11.0/24"
  private_subnet_cidr_b =  "10.1.12.0/24"
  region               = var.region
}

#Módulo para criação de Security Groups para ECS, Alb e RDS
module "security" {
    source = "./security"
    #importando variáveis
    vpc = module.networking.vpc 
    depends_on = [module.networking]
}

#Módulo para criação de Load balancer e target group
module "load_balancer"{
    source = "./load_balancer"
    #importando variáveis
    albSg = module.security.albSg
    subnetPublicA = module.networking.subnetPublicA
    subnetPublicB = module.networking.subnetPublicB
    vpc = module.networking.vpc 
    depends_on = [module.networking, module.security]
}

#Módulo para criação de Cluster, service, task definition, CloudWatch Logs,
# Auto Scaling Group
module "ecs" {
    source = "./ecs"
    #importando variáveis
    subnetPrivateA = module.networking.subnetPrivateA
    subnetPrivateB = module.networking.subnetPrivateB
    tgA = module.load_balancer.tgA
    serviceSg = module.security.serviceSg
    ecsRole = module.iam.ecsRole
    region = var.region
    depends_on = [module.load_balancer, module.iam]
}

#Módulo para criação de RDS
module "db"{
    source = "./db"
    #importando variáveis
    databaseSg = module.security.databaseSg
    subnetPrivateA = module.networking.subnetPrivateA
    subnetPrivateB = module.networking.subnetPrivateB
    depends_on = [module.security]
}