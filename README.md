Este repositório contém a entrega do desafio técnico de provisionamento de uma API Node.js conectada a um banco de dados PostgreSQL, executada de forma escalável na AWS.

## 🌐 Endereço da API (Deploy Ativo)
A aplicação pode ser acessada publicamente através do DNS do Load Balancer:
👉 **URL:** [http://api-alb-1269839128.us-east-1.elb.amazonaws.com](http://api-alb-1269839128.us-east-1.elb.amazonaws.com)

---

## 🏗️ Arquitetura da Solução

A infraestrutura foi desenhada seguindo o modelo de **camadas**, garantindo segurança e alta disponibilidade.

* **VPC Customizada:** Criação de uma rede isolada com Subnets Públicas e Privadas em múltiplas zonas de disponibilidade (AZs).
* **ECS Fargate (Orquestração):** A aplicação roda em containers utilizando um serviço Serverless, eliminando a necessidade de gerenciar instâncias EC2.
* **Amazon RDS (PostgreSQL):** Banco de dados gerenciado, isolado em subnets privadas, acessível apenas pela aplicação.
* **Application Load Balancer (ALB):** Responsável por receber as requisições externas e distribuir o tráfego entre as instâncias da API (Tasks).
* **Segurança:** Implementação de Security Groups restritivos, garantindo que o banco de dados só receba conexões vindas do serviço da API.

---

## 🛠️ Tecnologias Utilizadas

| Ferramenta | Utilização |
| :--- | :--- |
| **Terraform** | Infraestrutura como Código (IaC) |
| **Docker** | Containerização da aplicação |
| **Amazon ECS** | Orquestração de containers (Fargate) |
| **Amazon RDS** | Banco de dados PostgreSQL gerenciado |
| **Amazon ECR** | Registro de imagens Docker |
| **GitHub Actions** | Pipeline de CI/CD para deploy automático |

---

## 🚀 Fluxo de CI/CD

A pipeline de integração e entrega contínua foi configurada para que, a cada novo commit:
1. O **Dockerfile** seja buildado.
2. A imagem seja enviada para o **Amazon ECR**.
3. O **Amazon ECS** realize um *Rolling Update*, substituindo as tarefas antigas pelas novas sem causar indisponibilidade (Zero Downtime).

---

## 📁 Como executar este projeto localmente

### Pré-requisitos:
* AWS CLI configurado
* Terraform instalado

### Passo a passo:
1. Clone o repositório:
   ```bash
   git clone [https://github.com/SEU_USUARIO/simple-api.git](https://github.com/SEU_USUARIO/simple-api.git)

   Inicialize o Terraform:

Bash
terraform init
Planeje e aplique a infraestrutura:

Bash
terraform plan
terraform apply