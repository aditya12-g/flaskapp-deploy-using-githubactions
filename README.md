
# 🚀 Flask App Deployment using GitHub Actions & Terraform

![GitHub Actions](https://img.shields.io/github/actions/workflow/status/aditya12-g/flaskapp-deploy-using-githubactions/deploy.yml?branch=main)
![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Flask](https://img.shields.io/badge/Flask-2.0%2B-green)
![Terraform](https://img.shields.io/badge/Terraform-1.0%2B-purple)

---

## 📌 Project Overview
This project automates the deployment of a Flask application using:
- **GitHub Actions** for CI/CD  
- **Docker** for containerization  
- **Terraform** for AWS infrastructure provisioning  
- **AWS ECR & EC2** for hosting  

---

## 🏗️ Tech Stack
- **Python 3.8+**  
- **Flask Framework**  
- **Docker** (Containerization)  
- **GitHub Actions** (CI/CD Automation)  
- **Terraform** (Infrastructure as Code)  
- **AWS Services:**
  - **Elastic Container Registry (ECR)**
  - **Elastic Compute Cloud (EC2)**
  - **Virtual Private Cloud (VPC)**
  - **Identity and Access Management (IAM)**

---

## 📂 Project Structure  

### `.github/`
- `workflows/`
  - `build-deploy.yaml` → GitHub Actions workflow for CI/CD
  - terraform.yaml      → for creating infrastructure 
  - terraform-destroy.yaml → for destroying infrastructure 

### `src/`
- `app.py` → Main Flask application  
- `requirements.txt` → Python dependencies  

### `terraform/`
- `data.tf` → Data sources for Terraform  
- `ec2.tf` → EC2 instance configuration  
- `ecr.tf` → ECR repository configuration  
- `iamrole.tf` → IAM roles and policies  
- `provider.tf` → Terraform provider configurations  
- `variables.tf` → Variable definitions  
- `vpc.tf` → VPC and networking configurations  
- `terraform.tfvars` → Variable values  

### `root directory/`
- `docker-cleanup.sh` → Script for Docker cleanup tasks  
- `dockerfile` → Dockerfile for building the application image  
- `.gitattributes` → Git attributes configuration  
- `README.md` → Project documentation  

---

## 🚀 Deployment Guide
This is for ony manual setup for automation use github workflows'

### 1️⃣ Prerequisites
- **AWS Account** with IAM roles set up  
- **Terraform** installed (v1.0+)  
- **Docker** installed and configured  
- **Python 3.8+** installed  

---

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/aditya12-g/flaskapp-deploy-using-githubactions.git
cd flaskapp-deploy-using-githubactions

### 3️⃣ Infrastructure Provisioning with Terraform
---sh
terraform init
terraform plan
terraform apply

### 4️⃣ Build & Push Docker Image to AWS ECR
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
docker build -t flaskapp .
docker tag flaskapp:latest <account-id>.dkr.ecr.<region>.amazonaws.com/flaskapp:latest
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/flaskapp:latest

### 5️⃣ Deploy on AWS EC2
ssh -i <your-key.pem> ec2-user@<ec2-ip>
docker pull <account-id>.dkr.ecr.<region>.amazonaws.com/flaskapp:latest
docker run -d -p 80:5000 <account-id>.dkr.ecr.<region>.amazonaws.com/flaskapp:latest
(The app will be accessible via the EC2 instance's public IP.)

🔄 CI/CD Pipeline (GitHub Actions)
The GitHub Actions workflow (deploy.yml) automates:

Code Checkout & Dependencies Installation

Testing & Linting

Docker Build & Push to AWS ECR

Remote Deployment on EC2

🔧 Required GitHub Secrets:
AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION

ECR_REPOSITORY

EC2_INSTANCE_IP

EC2_SSH_PRIVATE_KEY


