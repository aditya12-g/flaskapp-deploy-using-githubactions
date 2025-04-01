
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
```
flaskapp-deploy-using-githubactions/
├── .github/
│   └── workflows/
│       └── deploy.yml        # GitHub Actions workflow for CI/CD
├── src/
│   ├── app.py                   # Main Flask application
│   ├── requirements.txt         # Python dependencies
├── terraform/
│   ├── data.tf                  # Data sources for Terraform
│   ├── ec2.tf                   # EC2 instance configuration
│   ├── ecr.tf                   # ECR repository configuration
│   ├── iamrole.tf               # IAM roles and policies
│   ├── provider.tf              # Terraform provider configurations
│   ├── variables.tf             # Variable definitions
│   ├── vpc.tf                   # VPC and networking configurations
│   ├── terraform.tfvars         # Variable values
├── scripts/
│   ├── terraform-deploy.sh      # Script to deploy infrastructure using Terraform
│   ├── terraform-destroy.sh     # Script to destroy infrastructure using Terraform
│   ├── docker-cleanup.sh        # Script for Docker cleanup tasks
├── Dockerfile                   # Dockerfile for building the application image
├── .gitattributes               # Git attributes configuration
└── README.md                    # Project documentation
```

---

## 🚀 Deployment Guide
### 1️⃣ Prerequisites
- AWS Account with necessary permissions.
- Terraform installed (v1.0+).
- Docker installed and configured.
- Python 3.8+ installed.

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/aditya12-g/flaskapp-deploy-using-githubactions.git
cd flaskapp-deploy-using-githubactions
```

### 3️⃣ Provision Infrastructure with Terraform
```sh
./scripts/terraform-deploy.sh
```
Or manually run:
```sh
cd terraform
terraform init
tf plan
tf apply
```

### 4️⃣ Build & Push Docker Image to AWS ECR
```sh
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
docker build -t flaskapp .
docker tag flaskapp:latest <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/flaskapp:latest
docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/flaskapp:latest
```

### 5️⃣ Deploy Application on AWS EC2
```sh
ssh -i <your-key-pair.pem> ec2-user@<ec2-instance-public-ip>
docker pull <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/flaskapp:latest
docker run -d -p 80:5000 <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/flaskapp:latest
```

### 6️⃣ Destroy Infrastructure (If Needed)
```sh
./scripts/terraform-destroy.sh
```
Or manually run:
```sh
cd terraform
terraform destroy
```

---

## 🔄 Continuous Deployment with GitHub Actions
The `.github/workflows/deploy.yml` file automates deployment:
1. **Checks out repository**
2. **Installs dependencies & runs tests**
3. **Builds & pushes Docker image to AWS ECR**
4. **Deploys to EC2 instance**

### 🔧 Required GitHub Secrets:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `ECR_REPOSITORY`
- `EC2_INSTANCE_IP`
- `EC2_SSH_PRIVATE_KEY`

---

## 🤝 Contribution
Contributions are welcome! Fork the repo, create a new branch, and submit a pull request.

## 📜 License
This project is licensed under the MIT License.

---

⭐ **Star this repo if you found it useful!** 🚀








