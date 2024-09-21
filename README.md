# Instructions for Testing the Terraform Deployment

## 1. Install Required Tools
- **Terraform**: Ensure Terraform is installed.
- **AWS CLI**: Install the AWS Command Line Interface.
- **Makefile**: Install the Makefile utility.
- **TFLint**: Install TFLint for Terraform linting.

## 2. Configure AWS IAM
- Generate an access key with `AdministratorAccess` permissions.
- Enable Multi-Factor Authentication (MFA).
- Create an EC2 key pair and save the associated `.pem` file.
- Configure the AWS CLI using the command:
    ```bash
    aws configure
    ```

## 3. Define Variables
Create a `dev.tfvars` file to define the necessary variables:
```hcl
region         = "your_region"
ami            = "your_ami_id"
email          = "your_email@example.com"
environment    = "development"
project        = "your_project_name"
owner          = "your_name"
repo           = "your_repo_url"
isdev          = true
db_name        = "your_database_name"
username       = "your_db_username"
password       = "your_db_password"
ssh_user       = "your_ssh_username"
ec2_type       = "t2.micro"
```

## 4. Create a State Bucket
Run the following commands:
```bash
aws s3api create-bucket --bucket nizam-terre-state --region us-east-1
aws s3api put-bucket-versioning --bucket nizam-terre-state --region us-east-1 --versioning-configuration Status=Enabled
```

## 5. Create a DynamoDB Table for State Locking
Execute the command:
```bash
aws dynamodb create-table \
    --table-name terre-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region us-east-1
```

## 6. Initialize Terraform
Run:
```bash
make init
```

## 7. Format Terraform Files
Use the command:
```bash
make fmt
```

## 8. Validate Terraform Configuration
Run:
```bash
make validate
```

## 9. Plan the Infrastructure
This command will outline the resources Terraform intends to create:
```bash
make plan
```
You can also export the plan to a JSON file:
```bash
terraform show -json terraformPlan > plan.json
```

## 10. Apply the Infrastructure
Provision the infrastructure in your AWS account by running:
```bash
make apply
```

## 11. Verify the Deployment
- Access the AWS Management Console.
- Navigate to the EC2 section to confirm that the API and database instances are running.
- Ensure that the API server is accessible via HTTP/HTTPS ports.
- Verify that the database server availability.
- Check CloudWatch Logs in the CloudWatch console.
- Confirm that CloudWatch alarms are triggered if CPU usage exceeds the defined threshold.

## 12. Cleanup
Once testing is complete, destroy the infrastructure to avoid incurring charges:
```bash
make destroy
```
Additionally, delete the state bucket and DynamoDB table:
```bash
aws s3api delete-bucket --bucket nizam-terre-state --region us-east-1
aws dynamodb delete-table --table-name terre-lock-table --region us-east-1
```
```
