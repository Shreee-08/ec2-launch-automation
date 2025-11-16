#!/bin/bash

# Load variables
IMAGE_ID="ami-0c02fb55956c7d316"        # Example Amazon Linux 2 AMI
INSTANCE_TYPE="t2.micro"
KEY_NAME="my-keypair"
SECURITY_GROUP="sg-0123456789abcdef0"
SUBNET_ID="subnet-0abcd1234ef567890"
INSTANCE_NAME="Automated-EC2"

echo "Launching EC2 instance..."
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $IMAGE_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --subnet-id $SUBNET_ID \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query "Instances[0].InstanceId" \
  --output text)

echo "Instance Launched with ID: $INSTANCE_ID"

# Fetching Public IP
PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-id $INSTANCE_ID \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text)

echo "Public IP: $PUBLIC_IP"
