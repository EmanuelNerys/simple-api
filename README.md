# 🚀 Simple API - Desafio DevOps (AWS, Terraform & CI/CD)

Este repositório contém a solução para o desafio de provisionamento e disponibilização pública de uma API Node.js conectada a um banco de dados PostgreSQL na nuvem AWS. 

A solução foi desenvolvida utilizando as melhores práticas de **Infraestrutura como Código (IaC)**, **Segurança em Camadas** e **Automação Total de Deploy (CI/CD)**.

---

## 🏛️ Arquitetura da Solução

A infraestrutura foi desenhada para ser resiliente, segura e escalável, utilizando uma abordagem modularizada no Terraform:

* **Networking (VPC Própria):**
    * Arquitetura de subnets segregadas (Públicas e Privadas) em múltiplas zonas de disponibilidade (Multi-AZ).
    * **Internet Gateway** para saída de tráfego público e **NAT Gateway** para permitir que recursos privados (API/Banco) acessem a internet com segurança.
* **Compute (ECS Fargate):**
    * Orquestração de containers serverless (sem necessidade de gerenciar instâncias EC2).
    * **Application Load Balancer (ALB)** para distribuição de tráfego e exposição da API na porta 80.
* **Database (RDS PostgreSQL):**
    * Banco de dados gerenciado em subnet privada, inacessível pela internet.
    * Configuração de Multi-AZ para alta disponibilidade.
* **CI/CD (AWS CodePipeline V2):**
    * Integração nativa com GitHub via CodeStar Connections.
    * Build automatizado via CodeBuild (Docker Push para ECR).
    * Deploy automático (Rolling Update) no ECS após o sucesso do Build.

---

## 🛠️ Tecnologias e Diferenciais Entregues

| Requisito | Solução Implementada | Status |
| :--- | :--- | :--- |
| **Containerização** | Docker com Dockerfile otimizado | ✅ |
| **Nova VPC** | VPC customizada com isolamento de rede | ✅ |
| **Hospedagem** | AWS ECS Fargate (Serverless) | ✅ |
| **Banco de Dados** | **Diferencial:** AWS RDS PostgreSQL | ✅ |
| **IaC** | **Diferencial:** 100% Terraform (Modularizado) | ✅ |
| **Pipeline CI/CD** | AWS CodePipeline (GitHub -> Build -> ECS) | ✅ |
| **Boas Práticas** | Multi-AZ, Camadas Privadas, NAT Gateway | ✅ |

---

## 📂 Estrutura do Projeto Terraform

A infraestrutura foi organizada em módulos para facilitar a manutenção e reutilização de código:

```text
terraform/
├── modules/
│   ├── networking/   # VPC, Subnets, IGW, NAT, Route Tables
│   ├── database/     # RDS Instance, Subnet Groups, Security Groups
│   ├── ecs/          # Cluster, Service, Task Definition, ALB
│   ├── ecr/          # Container Registry
│   └── pipeline/     # CodePipeline, CodeBuild, Roles IAM
├── main.tf           # Orquestração principal dos módulos
├── variables.tf      # Definição de variáveis globais
└── outputs.tf        # Exposição da URL final da API

Como Acessar a Aplicação
A API está disponível publicamente através do DNS do Load Balancer:

🔗 URL da API: SUBSTITUA_PELA_SUA_URL_AQUI

Nota: O deploy é realizado automaticamente a cada git push na branch main.

⚙️ Instruções para Deploy (IaC)
Caso deseje replicar este ambiente:

Configure suas credenciais AWS e a conexão com o GitHub.

Inicialize o Terraform:

Bash
terraform init
Aplique a infraestrutura:

Bash
terraform apply -auto-approve
