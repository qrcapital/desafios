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

module "networking" {
  source               = "./networking"
  vpc_cidr             = "10.1.0.0/16"
  public_subnet_cidr_a = "10.1.1.0/24"
  public_subnet_cidr_b = "10.1.2.0/24"
  private_subnet_cidr_a = "10.1.11.0/24"
  private_subnet_cidr_b =  "10.1.12.0/24"
  region               = var.region
}

# module "security" {
#     source = "./security"
#     esantosVPC = module.network.esantosVPC 
#     depends_on = [module.network]
# }

# module "ec2" {
#     source = "./ec2"
#     subnetPrivateA = module.network.subnetPrivateA
#     subnetPrivateB = module.network.subnetPrivateB
#     subnetPublicA  = module.network.subnetPublicA
#     subnetPublicB  = module.network.subnetPublicB
#     EC2PrivSecGP = module.security.EC2PrivSecGP 
#     EC2PubSecGP = module.security.EC2PubSecGP 
#     depends_on = [module.security]
# }

# module "db"{
#     source = "./db"
#     DBSecGP = module.security.DBSecGP
#     subnetPrivateA = module.network.subnetPrivateA
#     subnetPrivateB = module.network.subnetPrivateB
#     depends_on = [module.security]
# }