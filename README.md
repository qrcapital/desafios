# Resolução Desafio DevOps (Eudes Santos) 

Foi desenvolvida um infraestrutura serverless para cointaners usando Fargate e utilizando das melhores práticas de infraestrutura Cloud Native
Características a serem pontuadas:
- Aplicação de multi-az em todas as camadas para melhorar disponibilidade e proteção contra falhas
- Auto Scaling horizontal para escalabilidade (escalonamento para cima e para baixo)
- Toda a aplicação se comunica apenas e exclusivamente com seus pares utilizando security groups
- Conexão para internet dentro de subnets privadas feita via NAT Gateway

Para executar o código IaaS basta executar:
- terraform init
- terraform apply
- Digitar "yes" quando for solicitado

Arquitetura:
![alt text](https://github.com/eudesgsantos/desafios/blob/main/architecture.png?raw=true)
