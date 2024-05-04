#!/bin/bash

# Read Terraform outputs for GCP, Azure, and AWS public IP addresses
AWS_PUBLIC_IP=$(terraform output aws_public_ip)

# Write Ansible inventory file
echo "[web_servers]" > inventory.ini

# Write AWS public IP addresses to inventory
echo "[aws_hosts]" >> inventory.ini
echo "$AWS_PUBLIC_IP ansible_user=ubuntu ansible_ssh_private_key_file=/home/administrator/Desktop/LMS/awskey/great.pem" >> inventory.ini
