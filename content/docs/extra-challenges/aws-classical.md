+++
title = "The Cloud Resume Challenge - AWS (Classical Architecture)"
+++

An alternative flavour of the Cloud Resume Challenge using “traditional” architecture, rather than serverless. Using technologies such as virtual machines (VMs) gets you closer to concepts like networking and security. The challenge emphasizes more of the “operational” side of the challenge than the developer side. 

## 1. Setup an EC2 instance

Create an EC2 image, based on a Red Hat AMI from AWS. Use the default networking components that are given in your AWS account. Make the instance public on the internet.

## 2. Setup Apache

Use the `user_data` property on your EC2 image, install yum to download `httpd` (apache) and convert your base VM into a web server that returns a simple HTML file from your EC2 instance. 

## 3. Script as Terraform

Now it’s time to convert your EC2 image into “infrastructure as code”. Use Terraform to do this. Get familiar with `terraform plan` and `terraform apply`. Why Terraform? To learn an alternative, not cloud specific infra as code tool. 

## 4. Configure a Load Balancer

Architectures often use multiple instances to achieve high availability. Launch a duplicate EC2 instance. Setup a load balancer to alternate traffic. Terminating one instance should not affect your site being accessible. **Bonus point** Use autoscaling.

## 6. Create custom networks (VPC’s / Subnets)

Replace all the default AWS networking components with your own personal network (subnets, VPC, etc). Delete your default network components to test your network is working properly. 

## 7. Setup CI/CD (multi-environments)

Most companies have multiple "environments", for testing and for production/live code. Deploy your existing physical architecture twice using the same code (with different names). Deploy a "development" environment on commit to a git branch, and "production" on merge to the default branch (main). **Bonus point:** Use AWS organizations to deploy to multiple AWS accounts. 

## 8. Configure a relational database

Deploy a Postgres relational database into a private network. Ensure the database is only accessible by your EC2 instances. Create a SQL schema for your database, and execute a "database migration" from your `user_data` script using a tool like Knex.js. 

## 9. Configure Secrets

Secure your database password using AWS parameter store. Access your password from AWS Parameter store using an IAM role applied to the EC2 image. 

## 10. Setup a CloudWatch Dashboard / Alert

Setup a CloudWatch dashboard and CloudWatch email alert (using SNS) when an EC2 instance is unreachable. Manually stop your EC2 instance to test the alert. Write a “runbook” to restore the EC2. Add a link in the runbook for a CloudWatch monitoring dashboard. Use scripts, CI/CD or automation to trigger remediation steps where possible.

## 11. Migrate your code 

If you completed the serverless cloud resume challenge, you can copy over your HTML/CSS into the EC2. Rebuild your API's within the EC2, or continue to connect to your API Gateway as a backend. 

## Optional Quests

1. Use Packer/Docker to make a machine image (for EC2) - Swap init scripts with a Docker image or AMI.
2. Audit Trail (via CloudTrail) - Setup logging for your AWS actions. 
3. Setup a bastion host - Move instances to a private network, setup a bastion jump box (or use session manager).
4. Backup - Setup AWS backup to backup your EC2 image.