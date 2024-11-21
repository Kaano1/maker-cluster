---

# AWS Cluster Setup with Terraform and Ansible

This project leverages **Terraform** and **Ansible** to automate the creation of a cluster on **AWS**. With a single command, you can set up a cluster of your desired size. This solution is ideal for those who want to quickly provision AWS infrastructure and manage it with automation tools.

## Features
- **Automated Cluster Setup:** Create a cluster on AWS with any number of worker nodes.
- **Easy to Use:** Simply run `make` and provide the number of nodes when prompted.
- **Customizable:** Modify configuration files to adjust your environment.

## Prerequisites
Before you begin, ensure you have the following tools installed:
- **Terraform** (v1.x or higher)
- **Ansible** (v2.x or higher)
- **AWS CLI** (configured with your AWS credentials)

## Getting Started

1. **Clone the repository:**
   Clone this repository to your local machine.
   
   ```bash
   git clone https://github.com/yourusername/your-repository.git
   cd your-repository
   ```

2. **Configure the values:**
   You need to adjust some default values based on your environment before running the setup. 
   
   - Edit the worker and master node setup variables:
     - `maker-cluster/ansible/setup-worker-node/vars/main.yml`
     - `maker-cluster/ansible/setup-master-node/vars/main.yml`

   - Set the desired AWS region in the Terraform configuration.

     - `maker-cluster/terraform/main.tf`

   In these files, you can change settings like instance types, region, or any other parameters according to your requirements.

3. **Run the setup:**
   To create the cluster, simply run the following command:

   ```bash
   make
   ```

   You will be prompted to enter the number of worker nodes you want to create. Once provided, the Terraform and Ansible scripts will automatically deploy the infrastructure and configure your cluster.

## Configuration Files

### `maker-cluster/ansible/setup-worker-node/vars/main.yml`

This file contains hosts where to find the key locally:
- key location

### `maker-cluster/ansible/setup-master-node/vars/main.yml`

This file contains the configuration for the Master created key location for local computer:
- key location

### Region Configuration

The region for the AWS infrastructure can be configured in the Terraform files or as an environment variable:
- In `maker-cluster/terraform/main.tf`, set the desired AWS region.

   ```hcl
   provider "aws" {
     region = "us-west-2" # Update this to your desired region
   }
   ```


## Cleanup

Once you’re done with the cluster, you can easily destroy all resources by running:

```bash
make stop
```

This will destroy the AWS infrastructure created by Terraform, ensuring no resources are left behind.

