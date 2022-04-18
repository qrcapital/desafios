provider "aws" {
    region = var.region
}

#Usando das melhores práticas, salva o estado do terraform num s3 remoto, necessita a criação do s3 previamente.
# terraform {
#     backend "s3" {
#         key = "terraform/tfstate.tfstate"
#         bucket = "remote-backend"
#         region = var.region
#         access_key = "xxx"
#         secret_key = "xxx"
#     }
# }

#Módulo para criação de VPCs, Subnets etc

module "iam" {
    source = "./iam"
}

module "networking" {
  source               = "./networking"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidr_a = "10.1.1.0/24"
  public_subnet_cidr_b = "10.1.2.0/24"
  private_subnet_cidr_a = "10.1.11.0/24"
  private_subnet_cidr_b =  "10.1.12.0/24"
  region               = var.region
}

module "security" {
    source = "./security"
    vpc = module.networking.vpc 
    depends_on = [module.networking]
}

module "load_balancer"{
    source = "./load_balancer"
    albSg = module.security.albSg
    subnetPublicA = module.networking.subnetPublicA
    subnetPublicB = module.networking.subnetPublicB
    vpc = module.networking.vpc 
    depends_on = [module.networking, module.security]
}

module "ecs" {
    source = "./ecs"
    subnetPrivateA = module.networking.subnetPrivateA
    subnetPrivateB = module.networking.subnetPrivateB
    tgA = module.load_balancer.tgA
    serviceSg = module.security.serviceSg
    ecsRole = module.iam.ecsRole
    region = var.region
    depends_on = [module.load_balancer, module.iam]
}

module "db"{
    source = "./db"
    databaseSg = module.security.databaseSg
    subnetPrivateA = module.networking.subnetPrivateA
    subnetPrivateB = module.networking.subnetPrivateB
    depends_on = [module.security]
}