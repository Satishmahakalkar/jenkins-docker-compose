# Jenkins Terraform Project

This project automates the setup of a Jenkins server using Terraform and Docker. The infrastructure is created using AWS resources, and the Jenkins server is deployed with the help of Docker.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)

You will also need an AWS account and access to an Elastic IP to complete the setup.

## Project Structure

The project is structured as follows:




jenkins-docker-compose/
├── docker-compose.yml               # Docker Compose configuration file for Jenkins
└── terraform-jenkins/
    ├── main.tf                      # Main Terraform configuration file
    ├── modules                      # Directory containing Terraform modules
    │   ├── backup                   # Backup module for EC2 instance
    │   │   └── main.tf
    │   ├── ec2                      # EC2 instance configuration
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── eip                      # Elastic IP module
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── security-group           # Security group configuration
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   └── vpc                      # VPC configuration
    │       ├── main.tf
    │       ├── outputs.tf
    │       └── variables.tf
    ├── terraform.tfstate            # Terraform state file
    └── terraform.tfstate.backup     # Terraform state backup file 




    
## Setup and Installation

### 1. Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/Satishmahakalkar/jenkins-docker-compose.git



cd terraform-jenkins
terraform init
terraform apply -auto-approve
This will create the following resources:

A Virtual Private Cloud (VPC)
A subnet, route table, and internet gateway
An Elastic IP (EIP)
A security group
An EC2 instance with Jenkins installed

4. Set Up Jenkins with Docker
After the EC2 instance is up, Docker will be used to run Jenkins.

To start Jenkins, use the following Docker command:
docker-compose up -d
5. Access Jenkins
Once the Jenkins server is up, you can access it via the browser. Use the Elastic IP provided by Terraform and access Jenkins at:

cpp
Copy
Edit
http://<Elastic-IP>:8080

