# ec2-launch-automation
To automate the creation and configuration of an Amazon EC2 instance using a shell script (or Python Boto3) — eliminating the need for manual setup via the AWS Console.


# Automated EC2 Launch Using AWS CLI & Boto3
This project automates provisioning of an Amazon EC2 instance using both:
- Shell Script (AWS CLI)
- Python Script (Boto3)

# Features
- Launches EC2 instance automatically
- Auto applies tags, security group, subnet and key pair
- Fetches public IP after launch
- Demonstrates Infrastructure as Code (IaC) approach

# Tools & Technologies

AWS EC2 • AWS CLI • Python (Boto3) • Shell Script • IAM • VPC • Security Groups • Key Pairs

# Project Files
| File | Description |
|------|-------------|
| launch-ec2.sh | Shell script to launch EC2 using AWS CLI |
| launch_ec2.py | Python automation using Boto3 |
| variables.json | Input variables for Python script |
| README.md | Documentation |

# Prerequisites
- AWS CLI configured (`aws configure`)
- IAM user with EC2 permissions
- Python3 & boto3 (`pip install boto3`)
- Existing key pair + security group + subnet in target AWS region

# Usage
Run shell script
```bash
chmod +x launch-ec2.sh
./launch-ec2.sh
