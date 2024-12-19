# Voting App Infrastructure Deployment Guide

This README will guide you through deploying the Voting App infrastructure using Docker Compose, Terraform, and Ansible. Follow the steps carefully and adjust variables as needed to fit your requirements.

---

## Prerequisites

Before starting, ensure you have the following tools installed on your local machine:

1. **Docker and Docker Compose**
2. **Terraform**
3. **Ansible**
4. **AWS CLI** (configured with appropriate credentials)
5. **SSH Key** for accessing the bastion and EC2 instances

---

## Project Structure

Here is a quick overview of the project:

- **docker-compose.yml**: Defines the services and containers for running the Voting App locally.
- **Terraform Configuration Files**: Used to provision AWS resources (VPC, EC2, ALB, security groups, etc.).
- **Ansible Playbooks**: Automates configuration and deployment tasks on EC2 instances.
- **Variables**: Defined in `variables.tf` and overridden via `terraform.tfvars`.

---

## Deployment Steps

### 1. Run Locally Using Docker Compose

1. Navigate to the project directory where `docker-compose.yml` is located.
2. Build and run the containers:

   ```bash
   docker-compose up --build
   ```

3. Access the services locally:

   - **Vote App**: [http://localhost:8080](http://localhost:8080)
   - **Result App**: [http://localhost:8081](http://localhost:8081)

   Test the app by casting votes and viewing results. Confirm that Redis and Postgres are communicating properly.

---

## Provision Infrastructure Using Terraform

1. **Adjust Variables**:  
   Update the `terraform.tfvars` file to match your desired configuration. Key variables include:  
   - `region`: The AWS region to deploy in.  
   - `ami_image`: The AMI for your EC2 instances.  
   - `instance_type`: The instance type for EC2.  
   - Subnets and VPC configurations as needed.

2. **Initialize Terraform**:  
   Run the following to initialize the Terraform workspace:  

   ```bash
   terraform init
   ```

3. **Validate Configuration**:  
   Ensure the syntax and dependencies are correct:

   ```bash
   terraform validate
   ```

4. **Plan Deployment**:  
   Check the execution plan to see the resources that will be created:

   ```bash
   terraform plan
   ```

5. **Deploy Resources**:  
   Apply the Terraform configuration to create the infrastructure:

   ```bash
   terraform apply
   ```

6. **Output Review**:  
   After deployment, note the output values:

   - VPC ID
   - Public and private subnet IDs
   - Security group IDs
   - ALB DNS name (to access the frontend services)

---

## Configure EC2 Instances Using Ansible

1. **Place Ansible Files on Bastion Host**:  
   Copy the Ansible playbooks and roles to the bastion host. Use SCP or another secure transfer tool:

   ```bash
   scp -i <your-ssh-key> ansible-playbooks/* ec2-user@<bastion-host-ip>:/home/ec2-user/
   ```

2. **Connect to Bastion Host**:  
   SSH into the bastion host:

   ```bash
   ssh -i <your-ssh-key> ec2-user@<bastion-host-ip>
   ```

3. **Run Ansible Playbooks**:  
   Execute the Ansible playbooks to:

   - Install Docker on all EC2 instances
   - Pull Docker images from DockerHub
   - Start the containers on each EC2 instance

   Example command:

   ```bash
   ansible-playbook -i inventory.ini deploy-docker.yml
   ```

---

## Access the Application

Access the Voting App via the Application Load Balancer (ALB) DNS name:

- **Vote App**: [http://<ALB-DNS-Name>/vote](http://<ALB-DNS-Name>/vote)
- **Result App**: [http://<ALB-DNS-Name>/result](http://<ALB-DNS-Name>/result)