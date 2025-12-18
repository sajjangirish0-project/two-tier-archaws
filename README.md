# 🚀 Highly Available 2-Tier Architecture on AWS using Terraform & GitHub Actions

## 📌 Overview
This project demonstrates the deployment of a highly available 2-tier architecture on AWS using Terraform (Infrastructure as Code) and GitHub Actions for CI/CD automation.

## 🎯 Objectives
- Deploy 2-tier architecture (Web + Database)
- Use Terraform IaC
- High availability across AZs
- CI/CD with GitHub Actions

## 🏗️ Target Architecture
![Architecture](docs/images/architecture-diagram.png)

## 🧰 Technology Stack
- AWS
- Terraform
- GitHub Actions
- EC2 + Apache
- RDS MySQL
- ALB
- S3 + DynamoDB

## 🛠️ Implementation
### Web Tier
- EC2 instances in public subnets
- Apache installed via user_data
- ALB distributes traffic

### Database Tier
- RDS MySQL
- Private subnets
- Secure SG rules

## 📸 Outputs
<img width="775" height="396" alt="Screenshot 2025-12-18 at 12 05 56 AM" src="https://github.com/user-attachments/assets/1d42598b-fc0c-48f1-bb78-a07e01c8046f" />

<img width="1224" height="286" alt="Screenshot 2025-12-18 at 12 57 02 AM" src="https://github.com/user-attachments/assets/e4fcce8b-bed3-403d-af30-56ed31ddba1d" />

## 🔐 Remote State
- S3 backend
- DynamoDB locking

## ⚙️ GitHub Actions Workflow
Triggers on push to main:
- Terraform Init
- Terraform Plan

## 👤 Author
Girish
